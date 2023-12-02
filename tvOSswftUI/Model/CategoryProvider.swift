//
//  CategoryProvider.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//
import Foundation
import SwiftUI

class CategoryProvider: ObservableObject {
    @Published var categories: [Category] = []
    var currentCotext: ProviderContext = .general
    var dataProvider: DataProvider

    init(dataProvider: DataProvider) {
      self.dataProvider = dataProvider
    }
enum ProviderContext: Equatable{
    case general, favorites, lotsOfVideos
    
    var formattedName: String {
        switch self {
        case .general: return "모든 비디오"
        case .favorites: return "좋아요"
        case .lotsOfVideos: return "Lots of Videos"
        }
    }
    
    var missingCategoriesTitle: String {
        if self == .general || self == .lotsOfVideos {
            return "그 어떠한 비디오도 찾지 못했습니다."
        } else {
            return "좋아요한 비디오가 없습니다"
        }
    }
    
    var missingCategoriesDescription: String {
        if self == .general || self == .lotsOfVideos {
            return "비디오나 카테고리를 불러오지 못했습니다. 무언가 잘못되었나요?"
        } else {
            return "좋아하는 비디오가 없습니다."
        }
    }
}


////새로고침 함수
public func refresh() {
    switch currentCotext {
    case .general:
        categories = dataProvider.categories
    case .favorites:
        categories = dataProvider.massiveCategoryList
    case .lotsOfVideos:
        categories = dataProvider.categoriesWithFavoriteVideos
    }
}
}

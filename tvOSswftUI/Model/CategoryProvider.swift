//
//  CategoryProvider.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//
import Foundation

class CategoryProvider: ObservableObject {
  @Published var categories: [Category] = []
  var currentContext: ProviderContext = .general
  var dataProvider: DataProvider

  init(dataProvider: DataProvider) {
    self.dataProvider = dataProvider
  }

  enum ProviderContext: Equatable {
    case general, favorites, lotsOfVideos

    var formattedName: String {
      switch self {
      case .general: return "All Videos"
      case .favorites: return "Favorites"
      case .lotsOfVideos: return "Lots of Videos"
      }
    }
// 카데고리 제목이 누락 될 때
    var missingCategoriesTitle: String {
      if self == .general || self == .lotsOfVideos {
        return "Couldn't find any videos..."
      } else {
        return "No Favorite Videos"
      }
    }

    // 카테고리 설명이 누락 될 때
    var missingCategoriesDescription: String {
      if self == .general || self == .lotsOfVideos {
        return "비디오나 카테고리를 불러오지 못했습니다. 무언가 잘못되었나요?"
      } else {
        return "좋아하는 비디오가 없습니다.."
      }
    }
  }

  public func refresh() {
    switch currentContext {
    case .general:
      categories = dataProvider.categories
    case .lotsOfVideos:
      categories = dataProvider.massiveCategoryList
    case .favorites:
      categories = dataProvider.categoriesWithFavoriteVideos
    }
  }
}

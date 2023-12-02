//
//  DataProvider.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//
import Foundation
import SwiftUI

class DataProvider: ObservableObject {
    @Published var categories: [Category] = []
    var categoriesWithFavoriteVideos: [Category] {
        return categories.filter { category in
            return !category.favoriteVideos.isEmpty
            
        }
    }
    //변수
    var massiveCategoryList: [Category] {
        var categories: [Category] = []
        for _ in 0..<100 {
            categories.append(contentsOf: self.categories)
        }
        return categories
    }
    
    
    init() {
        categories = [
            Category(title: "샤넬", videos: [
                Video(
                    title: "샤넬", description: "특별한쇼 입니다", thumbnailName: "swiftui"
                )
            ]),
            
            Category(title: "구찌", videos: [
                Video(title: "2023컬렉션", description: "구찌의 특별쇼1", thumbnailName: "views"),
                Video(title: "2022컬렉션", description: "구찌의 특별쇼2", thumbnailName: "controls")
                
            ]),
            
            Category(title: "프라다", videos: [
                Video(title: "2023프라다 컬렉션", description: "프라다의 특별쇼1", thumbnailName: "fastlane"),
                
                Video(
                    title: "2022프라다 컬렉션", description: "프라다의 특별쇼2", thumbnailName: "rxswift")
                
                
            ]),
            
            Category(title: "루이비통", videos: [
                Video(
                    title: "2023루이비통 컬렉션",
                    description: "루이비통의 특별쇼1",
                    thumbnailName: "datastructures"
                ),
                Video(
                    title: "2022 루이비통 컬렉션",
                    description: "빛나는 오로라로 향하다",
                    thumbnailName: "arkit"
                ),
                
                Video(
                    title: "2021 루이비통 컬렉션",
                    description: "",
                    thumbnailName: "machinelearning"
                ),
                Video(
                    title: "2020 루이비통 컬렉션",
                    description: "",
                    thumbnailName: "notifications"
                )
            ])
        ]
        
    }
}


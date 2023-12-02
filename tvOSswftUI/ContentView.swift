//
//  ContentView.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var dataProvider = DataProvider()

  var body: some View {
    NavigationView {
      TabView {
        CategoryListView(categoryContext: .general, dataProvider: dataProvider)
          .tabItem {
            HStack {
              Image(systemName: "list.bullet.below.rectangle")
              Text("All Videos")
            }
          }
        CategoryListView(categoryContext: .favorites, dataProvider: dataProvider)
          .tabItem {
            HStack {
              Image(systemName: "heart.fill")
              Text("Favorites")
            }
          }
        CategoryListView(categoryContext: .lotsOfVideos, dataProvider: dataProvider)
          .tabItem {
            HStack {
              Image(systemName: "star.fill")
              Text("Lots of Videos")
            }
          }
      }
    }
  }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

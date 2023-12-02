//
//  Category.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//

import SwiftUI

class Category: Identifiable {
  var id = UUID()
    var title: String
    var videos: [Video]
    var favoriteVideos: [Video] {
        return videos.filter{ video in
            return video.favorite
            
        }
    }
    
    init(title: String, videos: [Video]) {
        self.title = title
        self.videos = videos
    }
   
}


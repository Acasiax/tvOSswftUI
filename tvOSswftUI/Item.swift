//
//  Item.swift
//  tvOSswftUI
//
//  Created by 이윤지 on 12/2/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

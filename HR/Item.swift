//
//  Item.swift
//  HR
//
//  Created by Kareem Abd El Sattar on 09/12/2023.
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

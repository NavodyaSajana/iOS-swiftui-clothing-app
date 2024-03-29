//
//  ItemDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-22.
//

import Foundation
import SwiftUI

struct ItemDataModel: Codable, Identifiable {
    var id: Int
    var prod_name: String
    var prod_image: String
    var prod_price: Double
    //var item_description: String
}

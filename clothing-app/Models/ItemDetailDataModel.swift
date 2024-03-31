//
//  ItemDetailDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-30.
//

import Foundation

struct ItemDetailDataModel : Codable {
    var item_id : Int
    var user_id : String
    var size : String
    var qty : Int
}

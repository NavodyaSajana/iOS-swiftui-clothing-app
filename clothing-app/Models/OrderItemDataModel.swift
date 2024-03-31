//
//  OrderItemDataMode.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation

struct OrderItemDataModel : Codable{
    var order_id: Int
    var item_id: Int
    var size: String
    var qty: Int
}

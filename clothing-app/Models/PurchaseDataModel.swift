//
//  PurchaseDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation

struct PurchaseDataModel: Codable, Identifiable {
    var id: Int
    var email: String
    var total: String
    var order_date: String
}

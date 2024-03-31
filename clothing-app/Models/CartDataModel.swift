//
//  CartDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-21.
//

import Foundation
import SwiftUI

struct CartDataModel : Codable, Identifiable {
    var id : Int
    var prod_name : String
    var prod_price : Double
    var prod_image : String
    var size : String
    var qty : Int
}

//var sampleCartData = [CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int"),
//                      CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int"),
//                      CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int")]

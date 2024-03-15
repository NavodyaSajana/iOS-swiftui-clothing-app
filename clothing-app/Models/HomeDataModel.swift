//
//  HomeDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-15.
//

import Foundation
import SwiftUI

struct HomeDataModel : Hashable{
    //clothing category data
    var categoryID = UUID().uuidString
    var categoryName : String
}

var sampleCategoryData = [HomeDataModel(categoryName: "All"),
                          HomeDataModel(categoryName: "Mens"),
                          HomeDataModel(categoryName: "Womens"),
                          HomeDataModel(categoryName: "Kids"),
                          HomeDataModel(categoryName: "Shoes"),
                          HomeDataModel(categoryName: "Winter"),
                          HomeDataModel(categoryName: "Summer")]

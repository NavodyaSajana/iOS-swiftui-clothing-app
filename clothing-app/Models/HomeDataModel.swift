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
                          HomeDataModel(categoryName: "Summer"),
                          HomeDataModel(categoryName: "Womens"),
                          HomeDataModel(categoryName: "Kids"),
                          HomeDataModel(categoryName: "Shoes"),
                          HomeDataModel(categoryName: "Winter"),
                          HomeDataModel(categoryName: "Summer")]

struct ClothingDataModel : Hashable{
    //popular clothing data
    var clothID = UUID().uuidString
    var imageName : String
    var price : String
    var name : String
}

//Image(systemName: "square.and.pencil.circle.fill")
var sampleClothingData = [ClothingDataModel(imageName: "trash.square.fill", price: "0.00", name: "test1"),
                          ClothingDataModel(imageName: "trash.square.fill", price: "0.00", name: "test2"),
                          ClothingDataModel(imageName: "trash.square.fill", price: "0.00", name: "test3"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test4"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test5"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test6"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test7"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test8"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test9"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test10"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test11"),
                          ClothingDataModel(imageName: "square.and.pencil.circle.fill", price: "0.00", name: "test12")]



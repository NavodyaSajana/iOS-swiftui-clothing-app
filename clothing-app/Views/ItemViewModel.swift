//
//  ItemViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-20.
//

import Foundation
import SwiftUI

class ItemViewModel : ObservableObject {
    @Published var clothingData = sampleClothingData
    @Published var categoryData = sampleCategoryData
    @Published var searchString : String = ""
    @Published var searchCategory : String = "All"
}

//
//  HomeViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-15.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var searchString : String = ""
    @Published var categoryData = sampleCategoryData
}

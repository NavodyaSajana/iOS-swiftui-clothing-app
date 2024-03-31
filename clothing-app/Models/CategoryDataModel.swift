//
//  CategoryDataMode.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-28.
//

import Foundation
import SwiftUI

struct CategoryDataModel: Codable, Identifiable {
    var id = UUID()
    var prod_category: String
}

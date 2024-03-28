//
//  ItemViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-20.
//

import Foundation
import SwiftUI

class ItemViewModel : ObservableObject {
    //@Published var itemData = sampleItemData
    @Published var categoryData = sampleCategoryData
    @Published var searchString : String = ""
    @Published var searchCategory : String = "All"
    
    @Published var itemDM = [ItemDataModel]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3000/api/products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ItemDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.itemDM = decodedResponse
                }
            }
        }.resume()
    }
}

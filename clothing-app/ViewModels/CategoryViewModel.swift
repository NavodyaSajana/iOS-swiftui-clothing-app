//
//  CategoryViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-28.
//

import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories = [String]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3000/api/product/categories") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([String].self, from: data) {
                DispatchQueue.main.async {
                    self.categories = decodedResponse
                }
            }
        }.resume()
    }
}

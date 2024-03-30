//
//  CartViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-21.
//

import Foundation
import SwiftUI

class CartViewModel : ObservableObject {
    @Published var errorMessage: String = ""
    @Published var items: [CartDataModel] = []
    @Published var total: Double = 0.00
    @Published var cartCount: Int = 0
    
    func fetchCartData(forEmail email: String) {
        guard let url = URL(string: "http://localhost:3000/api/cart/\(email)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([CartDataModel].self, from: data)
                DispatchQueue.main.async {
                    self.items = decodedData
                    self.calculateTotal()
                }
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }.resume()
    }
    
    func deleteCartItem(ForItemID id: String) {
        guard let url = URL(string: "http://localhost:3000/api/cart/\(id)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            
            
            DispatchQueue.main.async {
                // Handle successful deletion if needed
            }
        }.resume()
        
    }
    
    func removeFromCart(item : CartDataModel){
        items = items.filter { $0.id != item.id }
        calculateTotal()
    }
    
    private func calculateTotal() {
        var totalAmount: Double = 0.0
        for item in items {
            totalAmount += item.prod_price * Double(item.qty)
        }
        self.total = totalAmount
    }
}

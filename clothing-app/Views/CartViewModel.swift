//
//  CartViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-21.
//

import Foundation
import SwiftUI

class CartViewModel : ObservableObject {
    @Published private(set) var items : [ItemDataModel] = []
    @Published private(set) var total : Double = 0.00
    
    func addToCart(item : ItemDataModel){
        items.append(item)
        total += item.price
    }
    
    func removeFromCart(item : ItemDataModel){ 
        items = items.filter { $0.clothID != item.clothID }
        total -= item.price
    }
    
}

//
//  FavouriteViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-25.
//

import Foundation
import SwiftUI

class FavouriteViewModel : ObservableObject {
    @Published private(set) var items : [ItemDataModel] = []
    
    func addToFavourite(item : ItemDataModel){
        items.append(item)
    }
    
    func removeFromFavourite(item : ItemDataModel){
        items = items.filter { $0.clothID != item.clothID }
    }
    
}

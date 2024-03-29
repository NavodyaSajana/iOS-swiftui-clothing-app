//
//  ItemDetailViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-29.
//

import Foundation
import SwiftUI

class ItemDetailViewModel : ObservableObject {
    //@Published var itemDM: ItemDataModel?
    @Published private(set) var items : [ItemDataModel] = []
    
}

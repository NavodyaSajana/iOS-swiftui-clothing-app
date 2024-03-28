//
//  FavouriteView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-25.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var favVM : FavouriteViewModel
    
    var body: some View {
        List{
            if favVM.items.count > 0 {
                ForEach(favVM.items){
                    data in
                    FavouriteItemCard(itemDM: data)
                }
            } else {
                Text("Your Favourites is Empty")
            }
        }
        .frame(width: 370,height: 500)
    }
    
}

#Preview {
    FavouriteView()
        .environmentObject(FavouriteViewModel())
}

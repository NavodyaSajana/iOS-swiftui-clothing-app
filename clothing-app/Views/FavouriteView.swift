//
//  FavouriteView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-25.
//

import SwiftUI

struct FavouriteView: View {
    
    @StateObject var userVM : UserViewModel = UserViewModel()
    @StateObject var favVM : FavouriteViewModel = FavouriteViewModel()
    
    var body: some View {
        List{
            if userVM.authenticated {
                //favVM.fetchData(email: "userVM.usernam")
                if favVM.items.count < 0{
                    Text("Your favourites is Empty!")
                }else {
                    ForEach(favVM.items){
                        data in
                        FavouriteItemCard(itemDM: data)
                    }
                }
            } else {
                Text("Login to check your Favouries!")
            }
        }
    }
}

#Preview {
    FavouriteView()
}

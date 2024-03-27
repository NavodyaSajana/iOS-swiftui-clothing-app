//
//  NotificationView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack(spacing: 20){
                    Text("Notifications")
                        .bold()
                    
                    
                    ScrollView{//Favourite Display
                        Text("No notifications")
                        //                        LazyVGrid(columns: colomns, spacing: 20){
                        //                            ForEach(itemVM.itemData,id:\.self){
                        //                                cloth in
                        //                                //ClothingCard(itemDM.imageName :itemDM.imageName,name :itemDM.name,price:itemDM.price)
                        //                                ClothingCard(itemDM: cloth)
                        //                                    .environmentObject(cartVM)
                        //                            }
                        //                        }
                    }
                    
                    
                    
                }
                .padding(.top)
                .preferredColorScheme(.light)
                .frame(alignment: .bottom)
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NotificationView()
}

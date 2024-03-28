//
//  ClothingCard.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-22.
//

import Foundation
import SwiftUI

struct ClothingCard : View {
    @EnvironmentObject var cartVM : CartViewModel
    @EnvironmentObject var favVM : FavouriteViewModel
    @State private var refresh = false
    
    var itemDM: ItemDataModel
    
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                //image fetch using url
                let imageURL = URL(string: itemDM.prod_image)!
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Placeholder while loading
                            .cornerRadius(10)
                            .cornerRadius(10)
                            .frame(width: 160,height: 190)
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(10)
                            .cornerRadius(10)
                            .frame(width: 160,height: 190)
                    case .failure(let error):
                        Text("Failed to load image")
                            .foregroundColor(.red)
                            .padding()
                            .frame(width: 160,height: 190)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                            .onTapGesture {
                                print("Error loading image: \(error.localizedDescription)")
                            }
                    default:
                        //EmptyView()
                        Image("sampleMen")
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 160,height: 190)
                            .scaledToFit()
                    }
                }
                HStack{
                    VStack(alignment: .leading){
                        Text(itemDM.prod_name)
                            .font(.system(size: 14, weight: .bold))
                            
                        Text("\(itemDM.prod_price, specifier: "%.2f") $")
                            .font(.caption)
                            .font(.system(size: 10))
                    }
                    Spacer()
                    Button{
                        favVM.addToFavourite(item: itemDM)
                    } label: {
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                            .foregroundColor(.red)
                    }
                    
                }
                .padding()
                .frame(width: 160, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            }
            //.frame(width:100,height: 180)
            .shadow(radius: 9)
            
            //            Button(action: {
            //                cartVM.addToCart(item: itemDM)
            //            }, label: {
            //                Circle()
            //                    .frame(width: 38)
            //                    .foregroundColor(.gray)
            //                    .shadow(radius: 15)
            //                    .overlay{
            //                        Image(systemName: "plus")
            //                        //.padding(1)
            //                            .foregroundColor(.black)
            //                        //.background(.gray)
            //                            .cornerRadius(50)
            //                            .imageScale(.medium)
            //                            .padding()
            //                    }
            //
            //            })
        }
    }
}

//#Preview{
//    ClothingCard(itemDM : sampleItemData[0])
//}

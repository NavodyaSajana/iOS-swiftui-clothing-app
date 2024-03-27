//
//  CartItemCard.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-21.
//

import Foundation
import SwiftUI

struct CartItemCard : View {
    @EnvironmentObject var cartVM : CartViewModel
    @State var getSize:Int = 1
    @State var size:String = "S"
    
    var itemDM : ItemDataModel
    
    var body: some View{
        HStack{
            Image(itemDM.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
            //Spacer()
            VStack{
                Text(itemDM.name)
                Text("\(itemDM.price, specifier: "%.2f") $")
            }
            .padding()
            Spacer()
            VStack{
                Circle()
                    .frame(width: 40)
                    .foregroundColor(Color.gray)
                    .overlay{
                        Text(size)
                    }
            }
            Spacer()
        }
        //.padding(.leading)
        .foregroundStyle(.black.opacity(0.8))
        .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/,content: {
            Button(action: {
                withAnimation{
                    cartVM.removeFromCart(item: itemDM)
                }
            }, label: {
                Text("Remove")
            }).tint(.red)
        })
        .swipeActions(edge:.leading,content: {
            Button(action: {
                size = "S"
            }, label: {
                Text("S")
            })
            .tint(.green)
            
            Button(action: {
                size = "M"
            }, label: {
                Text("M")
            })
            .tint(.blue)
            
            Button(action: {
                size = "L"
            }, label: {
                Text("L")
            })
            .tint(.yellow)
            
            Button(action: {
                size = "XL"
            }, label: {
                Text("XL")
            })
            .tint(.orange)
        })
        
    }
}

#Preview {
    CartItemCard(itemDM: sampleItemData[0])
}

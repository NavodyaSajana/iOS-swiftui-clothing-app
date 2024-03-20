//
//  CartItemCardView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-21.
//

import Foundation
import SwiftUI

struct CartItemCardView : View {
    var imageName : String
    var name : String
    var price : String
    var quantity : String
    var size : String
    
    var body: some View{
        
            RoundedRectangle(cornerRadius: 10)
                .frame(width:350,height: 120)
                .padding(.horizontal)
                .foregroundColor(.white)
                .overlay{
                    HStack{
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                        VStack{
                            Text(name)
                            Text(price)
                            Text(quantity)
                        }
                        .padding()
                        Spacer()
                        VStack{
                            Text(size).bold()
                        }.padding()
                    }
                    .padding(.horizontal,30)
                    .foregroundStyle(.black.opacity(0.8))
                    .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/,content: {
                        Button(action: {}, label: {
                            Text("Remove")
                        }).tint(.red)
                    })
                }
        
    }
}

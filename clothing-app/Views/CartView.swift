//
//  CartView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-20.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var cartVM : CartViewModel = CartViewModel()
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                HStack{//Navigator Item
                    Text("Cart").bold()
                }
                
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 370,height: 500)
                        .foregroundColor(Color("DefaultRectangleBg"))
                        .overlay{
                            ScrollView{
                                VStack{
                                    ForEach(cartVM.cartData,id:\.self){
                                        data in
                                        CartItemCardView(imageName: data.image, name: data.name, price: data.price, quantity: data.quantity, size: data.size)
                                    }
                                }
                                .padding()
                            }
                        }
                }
                Spacer()
                
                
                Button(action:{},label: {
                    RoundedRectangle(cornerRadius: 50)
                        .padding(.horizontal,15)
                        .frame(height:60)
                        .overlay{
                            HStack{
                                Text("Checkout")
                                    .foregroundStyle(.white).bold()
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white)
                            }
                        }
                })
                
                //Spacer()
                
            }
            .padding(.top)
            .preferredColorScheme(.light)
            
        }
    }
}

#Preview {
    CartView()
}

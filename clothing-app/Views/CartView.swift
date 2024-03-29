//
//  CartView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-20.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartVM : CartViewModel
    
    var body: some View {
        ZStack{
            NavigationStack{
                Spacer()
                VStack(spacing: 20){
                    Text("Cart").bold()
                        .font(.title)
                    
                    //Spacer()
                    VStack{
                        List{
                            if cartVM.items.count > 0 {
                                ForEach(cartVM.items){
                                    data in
                                    CartItemCard(itemDM: data)
                                }
                            } else {
                                Text("Your Cart is Empty")
                            }
                        }
                        .frame(width: 370,height: 500)
                    }
                    Spacer()
                    
                    VStack{
                        Spacer()
                        HStack{
                            Text("Total")
                            Spacer()
                            Text("\(cartVM.total, specifier: "%.2f") $")
                        }
                        HStack{
                            Text("Discount")
                            Spacer()
                            Text("0.00 $")
                        }
                        Spacer()
                        //1 Spacer()
                        HStack{
                            Text("Amount")
                            Spacer()
                            Text("\(cartVM.total, specifier: "%.2f") $")
                        }
                    }.padding(.horizontal,20)
                    Button{
                        print("user login")
                    } label: {
                        HStack{
                            Text("CHECKOUT")
                                .foregroundStyle(.white).bold()
                            Image(systemName: "arrow.forward")
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32,height:48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    Spacer()
                }
                .padding(.top)
                .padding(.bottom)
                .preferredColorScheme(.light)
                Spacer()
            }
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}

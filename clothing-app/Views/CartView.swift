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
                VStack(spacing: 20){
                    //HStack{//Menu Name
                    Text("Cart").bold()
                    // }
                    
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 370,height: 500)
                            .foregroundColor(Color("DefaultRectangleBg"))
                            .overlay{
                                ScrollView{
                                    VStack{
                                        if cartVM.items.count > 0 {
                                            ForEach(cartVM.items,id:\.self){
                                                data in
                                                CartItemCard(itemDM: data)
                                            }
                                        } else {
                                            Text("Your Cart is Empty")
                                        }
                                    }
                                    .padding()
                                }
                            }
                    }
                    Spacer()
                    
                    VStack{
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
                    
                    
//                    Button(action:{},label: {
//                        RoundedRectangle(cornerRadius: 50)
//                            .padding(.horizontal,15)
//                            .frame(height:60)
//                            .overlay{
//                                HStack{
//                                    Text("Checkout")
//                                        .foregroundStyle(.white).bold()
//                                    Image(systemName: "arrow.forward")
//                                        .foregroundColor(.white)
//                                }
//                            }
//                    })
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
//            .navigationBarBackButtonHidden(true)
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading){
//                    NavigationLink(destination:{
//                        //EmptyView()
//                        DashboardView()
//                    },label: {
//                        Image(systemName : "chevron.backward")
//                        Text("Home")
//                    })
//                }
//            }
            
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}

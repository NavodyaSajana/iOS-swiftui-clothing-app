//
//  HomeView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-14.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var homeVM : HomeViewModel = HomeViewModel()
    @StateObject var itemVM : ItemViewModel = ItemViewModel()
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel()
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var favVM : FavouriteViewModel = FavouriteViewModel()
    @State private var showingItem = false
    var colomns = [GridItem(.adaptive(minimum: 160), spacing: 0)]
    
    var body: some View {
        
        //var searchText: String="null"
        ZStack{
            NavigationView{
                VStack(spacing: 20){
                    //Welcome band
                    HStack{//the welcome note and the cart icon
                        
                        
                        RoundedRectangle(cornerRadius: 0)
                            .frame(width: 330,height: 40)
                            .padding(.horizontal,10)
                            .opacity(0)
                            .overlay{
                                HStack{
                                    HStack{
                                        VStack{
                                            Text("Hello Welcome!").font(.custom("SF Armenian",size: 15))
                                            Text("Sajana Rupasihgnghe").bold()
                                        }
                                    }
                                    Spacer()
                                    NavigationLink(destination:{
                                        //EmptyView()
                                        CartView()
                                            .environmentObject(cartVM)
                                            .toolbar(.hidden, for:.tabBar)
                                    },label: {
                                        CartButton(numberOfProducts: cartVM.items.count)
                                    })
                                }
                            }
                        
                    }
                    
                    HStack{//Item Search bar
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height:40)
                            .padding(.horizontal,10)
                            .foregroundColor(Color("DefaultRectangleBg"))
                            .overlay{
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    TextField("What are you looking for...",text: $homeVM.searchString)
                                }.padding(.horizontal,48)
                            }
                    }
                    
                    HStack{// Show the basic categories
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 320,height: 25)
                            .padding(.horizontal, 15 )
                            .opacity(0)
                            .overlay{
                                ScrollView(.horizontal){
                                    LazyHStack{
                                        ForEach(categoryVM.categories, id: \.self){
                                            data in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 90,height: 30)
                                                .foregroundColor(Color("DefaultRectangleBg"))
                                                .overlay{
                                                    Text(data)
                                                }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal,10)
                        
                    }
                    .padding(.horizontal,5)
                    
                    ScrollView{
                        LazyVGrid(columns: colomns, spacing: 20){
                            ForEach(itemVM.itemDM){
                                cloth in
                                Button {
                                    showingItem = true
                                } label: {
                                    ClothingCard(itemDM: cloth)
                                        .environmentObject(cartVM)
                                        .environmentObject(favVM)
                                }
                                .popover(isPresented: $showingItem, content: {
                                    Text("Select your Size")
                                })
                                
                            }
                        }
                    }
                    
                    
                    
                }
                .padding(.top)
                .preferredColorScheme(.light)
                .frame(alignment: .bottom)
                Spacer()
                
            }
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
    
    
}



#Preview {
    HomeView()
}

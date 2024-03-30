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
    @StateObject var userVM : UserViewModel = UserViewModel()
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel()
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var favVM : FavouriteViewModel = FavouriteViewModel()
    @State private var showingItem = false
    @State private var selectedCategory: String?
    @State private var searchString: String = ""
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
                                            if userVM.authenticated {
                                                Text(userVM.username).bold()
                                            } else {
                                                Text("The Z Store").bold()
                                            }
                                        }
                                    }
                                    Spacer()
                                    NavigationLink(destination:{
                                        //EmptyView()
                                        CartView()
                                            .toolbar(.hidden, for:.tabBar)
                                    },label: {
                                        CartButton(numberOfProducts: cartVM.items.count)
                                    })
                                }
                            }
                        
                    }
                    .onAppear{
                        if userVM.authenticated{
                            cartVM.fetchCartData(forEmail: userVM.username)
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
                                    TextField("What are you looking for...",text: $searchString)
                                        .onChange(of: searchString) {  _ in
                                            itemVM.fetchData(category: selectedCategory ?? "All", searchString: searchString)
                                        }
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
                                        Button {
                                            itemVM.fetchData()
                                        } label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 90,height: 30)
                                                .foregroundColor(Color("DefaultRectangleBg"))
                                                .overlay{
                                                    Text("All")
                                                }
                                        }
                                        ForEach(categoryVM.categories, id: \.self){
                                            data in
                                            Button {
                                                selectedCategory = data
                                                itemVM.fetchData(category: selectedCategory ?? "Mens",searchString: self.searchString)
                                            } label: {
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
                            }
                            .padding(.horizontal,10)
                        
                    }
                    .padding(.horizontal,5)
                    
                    ScrollView{
                        LazyVGrid(columns: colomns, spacing: 20){
                            ForEach(itemVM.itemDM){
                                cloth in
                                ClothingCard(itemDM: cloth,favVM: favVM, userVM: userVM)
                                        .environmentObject(cartVM)
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

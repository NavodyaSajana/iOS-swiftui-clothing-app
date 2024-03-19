//
//  HomeView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-14.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var homeVM : HomeViewModel = HomeViewModel()
    
    
    var body: some View {
        
        //var searchText: String="null"
        ZStack{
            VStack(spacing: 20){
                //Welcome band
                HStack{//the welcome note and the cart icon
                    
                    
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: 330,height: 40)
                        .padding(.horizontal,10)
                        .opacity(0)
                        .overlay{
                            HStack(spacing:170){
                                VStack{
                                    Text("Hello Welcome!").font(.custom("SF Armenian",size: 15))
                                    Text("Sajana Rupasinghe").bold()
                                }
                                Image(systemName: "cart")
                                    .foregroundColor(.black)
                            }
                        }
                    
                }
                
                HStack{//Item Search bar
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height:40)
                        .padding(.horizontal,10)
                        .foregroundColor(.gray)
                        .overlay{
                            HStack{
                                Image(systemName: "magnifyingglass")
                                TextField("What are you looking for...",text: $homeVM.searchString)
                            }.padding(.horizontal,48)
                        }
                }
                
                HStack{//Message with Image (discounts, downtimes, etc...)
                    RoundedRectangle(cornerRadius: 10)
                        .padding(.horizontal, 10)
                        .frame(height:135)
                        .foregroundColor(.gray)
                        .overlay{
                            HStack{
                                HStack{
                                    RoundedRectangle(cornerRadius: 0)
                                        .frame(maxHeight: .infinity)
                                        .opacity(0)
                                        .overlay{
                                            VStack{
                                                Text("Discount")
                                                Text("Discount")
                                                Text("Discount")
                                            }
                                            
                                        }
                                }
                                HStack{
                                    RoundedRectangle(cornerRadius: 0)
                                        .frame(maxHeight: .infinity)
                                }
                            }.padding(.horizontal,35)
                            
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
                                        ForEach(homeVM.categoryData,id:\.self){
                                            category in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 90,height: 30)
                                                .foregroundColor(.gray)
                                                .overlay{
                                                    Text(category.categoryName)
                                                }
                                        }
                                }
                            }
                        }
                        .padding(.horizontal,10)
                    
                }
                .padding(.horizontal,5)
                
                ScrollView{// Show Popular items over here
                    VStack{
                        ForEach(homeVM.clothingData,id:\.self){
                            cloth in
                            VStack{
                                HStack(spacing: 20){
                                    ClothingCardView(imageName :cloth.imageName,name :cloth.name,price:cloth.price)
                                    ClothingCardView(imageName :cloth.imageName,name :cloth.name,price:cloth.price)
                                }
                            }
                        }
                    }
                }
                
                
                HStack(spacing: 80){//Navigator
                    Image(systemName: "house.fill")
                    Image(systemName: "heart")
                    Image(systemName: "bell")
                    Image(systemName: "person")
                }
                
                Spacer()
               
            }
            .padding(.top)
            
        }
        
    }
    
    
}



#Preview {
    HomeView()
}

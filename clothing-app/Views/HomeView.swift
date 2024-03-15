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
            VStack(spacing: 20){//Welcome band
                HStack(spacing: 200){//the welcome note and the cart icon
                    VStack{
                        Text("Hello Welcome!")
                        Text("USER_NAME")
                    }
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                        .dynamicTypeSize(.xLarge)
                    
                }
                
                HStack{//Item Search bar
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height:40)
                        .padding(.horizontal,10)
                        .foregroundColor(.gray)
                        .overlay{
                            HStack{
                                Image(systemName: "lock")
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
                        .frame(height: 200)
                        .padding(.horizontal, 10 )
                        .foregroundColor(.blue)
                        .overlay{
                            HStack{
                                List{
                                    ForEach(homeVM.categoryData,id:\.self){
                                        category in
                                        Text(category.categoryName)
                                    }
                                }
                            }
                            .padding()
                        }
                    
                }
                .padding(.horizontal,5)
            }
            .padding(.top)
            
        }
        Spacer()
        
    }
    
    
}



#Preview {
    HomeView()
}

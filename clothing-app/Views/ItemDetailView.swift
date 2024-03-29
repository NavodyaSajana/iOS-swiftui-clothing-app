//
//  ItemDetailView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-29.
//

import SwiftUI

struct ItemDetailView: View {
    
    //@State var itemDM = [ItemDataModel]()
    //@EnvironmentObject var cartVM : CartViewModel
    //@StateObject var userVM = UserViewModel()
    @StateObject var itemDetailsVM = ItemDetailViewModel()
    @State var getSelection : String = ""
    var itemDM: ItemDataModel
    
    var body: some View {
        
        //let item = itemDetailsVM.itemDM
        //var name: String =  itemDetailsVM.items.first?.prod_name ?? default "value"
        NavigationView{
            ZStack{
                VStack{
                    //Spacer()
                    
                    let imageURL = URL(string: itemDM.prod_image)!
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while loading
                                .cornerRadius(10)
                                .cornerRadius(10)
                                .frame(width: .infinity,height: 400)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: .infinity,height: 400)
                                .scaledToFill()
                                .padding()
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
                                .frame(width: .infinity,height: 400)
                                .scaledToFill()
                                .padding()
                        }
                    }
                        
                        Spacer()
                    Text(itemDM.prod_name)
                        .font(.title)
                        .font(.system(size: 12))
                    Text("$ \(itemDM.prod_price, specifier: "%.2f")")
                        ScrollView{
                            Text("This Item can be purchased from any of our stores. For returns call our team they will arrange you the relevants")
                            //.frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading)
                        .padding(.trailing)
                    
                    //Spacer()
                    
                    
                    HStack{
                        Button(action: {
                            getSelection = "XS"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "XS" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("XS")
                                }
                        })
                        Button(action: {
                            getSelection = "S"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "S" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("S")
                                }
                        })
                        Button(action: {
                            getSelection = "M"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "M" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("M")
                                }
                        })
                        Button(action: {
                            getSelection = "L"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "L" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("L")
                                }
                        })
                        Button(action: {
                            getSelection = "XL"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "XL" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("XL")
                                }
                        })
                    }
                    Spacer()
                    Button(action:{
                        
                    },label: {
                        HStack{
                            Text("ADD TO CART")
                                .foregroundStyle(.white).bold()
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32,height:48)
                    })
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    .padding(.top,24)
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    ItemDetailView(itemDM: ItemDataModel)
//}

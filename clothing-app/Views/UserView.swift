//
//  UserView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct UserView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @StateObject var userVM = UserViewModel()
    
    var body: some View {
        NavigationStack{
            if userVM.authenticated{
                NavigationStack{
                    ZStack{
                        VStack{
                            Spacer()
                            List{
                                Section{
                                    HStack{
                                        Image("sampleMen")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 72,height: 72)
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        VStack(alignment: .leading,spacing: 4){
                                            Text("\(userVM.username)")
                                                .font(.title)
                                            
                                            Text("\(userVM.email)")
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                }
                                
                                Section("Delivery Address"){
                                    
                                    VStack(alignment: .leading,spacing: 4){
                                        Text("Address Number")
                                        Text("Address Line 1")
                                        Text("Address Line 2")
                                        Text("Address City")
                                    }
                                }
                                
                                Section("Settings"){
                                    VStack(alignment: .center,
                                           spacing: 20){
                                        Button{
                                            userVM.logout()
                                        }label:{
                                            HStack{
                                                HStack(spacing: 3){
                                                    Text("Want to Exit?")
                                                    Text("Sign out")
                                                        .bold()
                                                }
                                                .font(.system(size: 14))
                                                .tint(.red)
                                            }
                                        }
                                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                }
                                
                            }
                            .opacity(0.8)
                            Spacer()
                            
                        }
                    }
                }
            }else{
                //image
                
                Image("sampleMen")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100,height:120)
                    .padding(.vertical,32)
                
                //form field
                
                VStack{
                    UserInputView(text:$userVM.username, title: "Email Address", placeHolder: "name@example.com")
                        .textInputAutocapitalization(.none)
                    
                    UserInputView(text:$userVM.password, title: "Password", placeHolder: "Password", isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.vertical)
                if(userVM.showError){
                    Text(userVM.errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 14))
                }else{
                    Text("")
                }
                //sign in button
                
                Button(action:{
                    userVM.verifyLogin()
                },label: {
                    HStack{
                        Text("SIGN IN")
                            .foregroundStyle(.white).bold()
                        //Image(systemName: "arrow.forward")
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,height:48)
                })
                .background(Color(.systemBlue))
                .cornerRadius(50)
                .padding(.top,24)
                
                Spacer()
                
                //sign up button
                
                NavigationLink{
                    SignUpView()
                } label : {
                    HStack(spacing: 3){
                        Text("Haven't Registered Yet?")
                        Text("Register Now")
                            .bold()
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    UserView()
}

//
//  LoginView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    var body: some View {
        NavigationStack{
            //image
            Image("sampleMen")
                .resizable()
                .scaledToFill()
                .frame(width:100,height:120)
                .padding(.vertical,32)
            
            //form field
            
            VStack{
                UserInputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                    .textInputAutocapitalization(.none)
                
                UserInputView(text: $password, title: "Password", placeHolder: "Password", isSecureField: true)
                
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            //sign in button
            
            Button{
                print("user login")
            } label: {
                HStack{
                    Text("SIGN IN")
                        .foregroundStyle(.white).bold()
                    Image(systemName: "arrow.forward")
                        
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32,height:48)
            }
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

#Preview {
    LoginView()
}

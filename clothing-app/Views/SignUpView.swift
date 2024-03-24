//
//  SignUpView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email : String = ""
    @State private var fullName : String = ""
    @State private var password : String = ""
    @State private var confirmPwd : String = ""
    @Environment(\.dismiss) var dismiss
    
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
                
                UserInputView(text: $fullName, title: "Full Name", placeHolder: "Full Name")
                
                UserInputView(text: $password, title: "Password", placeHolder: "Password", isSecureField: true)
                
                UserInputView(text: $confirmPwd, title: "Confirm Password", placeHolder: "Confirm Password", isSecureField: true)
                
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            //sign in button
            
            Button{
                print("user signup")
            } label: {
                HStack{
                    Text("REGISTER")
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
            
            Button{
                dismiss()
            } label: {
                HStack{
                    HStack(spacing: 3){
                        Text("Already Registered?")
                        Text("Sign in")
                            .bold()
                    }
                    .font(.system(size: 14))
                }
            }
            
//            NavigationLink{
//                
//            } label : {

//                .font(.system(size: 14))
//            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SignUpView()
}

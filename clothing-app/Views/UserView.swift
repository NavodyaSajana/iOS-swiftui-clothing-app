//
//  UserView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct UserView: View {
    @StateObject var userVM:UserViewModel = UserViewModel()
    @State private var fullName:String = "Sajana Rupasinghe"
    @State private var email:String = "sajana@abc.lk"
    var body: some View {
        NavigationStack{
            VStack(alignment: .center,
            spacing: 20){
                
                Image("sampleMen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("\(userVM.userData.fullName)")
                    .font(.title)
                
                Text("\(userVM.userData.email)")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button{
                    print("logout")
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
}

#Preview {
    UserView()
}

//
//  UserViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-24.
//

import Foundation
import SwiftUI


class UserViewModel : ObservableObject{
    @Published var users: [UserDataModel] = []
    
    @AppStorage("AUTH_KEY") var authenticated = false{
        willSet {objectWillChange.send()}
    }
    @AppStorage("USER_KEY") var username = ""
    
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    @Published var email : String = "abc@abc.lk"
    
    //Fetching User data using the api
    
    //User data fetching over
    
    func verifyLogin(){
        if username.isEmpty || password.isEmpty{
            showError = true
            errorMessage = "Username and Password cannot be empty!"
        }else if(!username.isEmpty && !password.isEmpty){
            showError = false
            success = true
            authenticated = true
        }else{
            showError = true
            errorMessage = "Username and Password mismatched. Please try again!"
        }
    }
    
    func logout() {
        self.password = ""
        
        withAnimation{
            authenticated.toggle()
        }
    }
}

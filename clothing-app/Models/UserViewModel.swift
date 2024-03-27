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
    @AppStorage("USER_KEY") var fullName = ""
    
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    @Published var email : String = ""
    
    //Fetching User data using the api
    
    //User data fetching over
    
    //    func verifyLogin(){
    //        if username.isEmpty || password.isEmpty{
    //            showError = true
    //            errorMessage = "Username and Password cannot be empty!"
    //        }else{
    //            guard let url = URL(string: "http://localhost:3000/api/users/login") else {
    //                self.errorMessage = "Invalid URL"
    //                return
    //            }
    //            
    //            var request = URLRequest(url: url)
    //            request.httpMethod = "POST"
    //            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //            let credentials = ["email": email, "password": password]
    //            do {
    //                let jsonData = try JSONEncoder().encode(credentials)
    //                request.httpBody = jsonData
    //            } catch {
    //                self.errorMessage = "Error encoding credentials"
    //                return
    //            }
    //
    //            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
    //                DispatchQueue.main.async {
    //                    guard let self = self else { return }
    //
    //                    if let error = error {
    //                        self.showError = true
    //                        self.errorMessage = "Login failed: \(error.localizedDescription)"
    //                        return
    //                    }
    //
    //                    guard let httpResponse = response as? HTTPURLResponse else {
    //                        self.showError = true
    //                        self.errorMessage = "Invalid response"
    //                        return
    //                    }
    //
    //                    if httpResponse.statusCode == 200 {
    //                        //self.isAuthenticated = true
    //                        //self.errorMessage = nil
    //                        self.showError = false
    //                        self.success = true
    //                        self.authenticated = true
    //                        //self.
    //                        //self.errorMessage = "Login successful!"
    //                        //self.onLoginSuccess?()
    //                    }
    //                    
    //                    
    //                    else {
    //                        self.errorMessage = "Login failed: Invalid credentials or server error"
    //                    }
    //                }
    //            }.resume()
    //        }
    //    }
    
    func logout() {
        self.password = ""
        
        withAnimation{
            authenticated.toggle()
        }
    }
    
    func login(email: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/api/users/login") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let credentials = ["email": email, "password": password]
        do {
            let jsonData = try JSONEncoder().encode(credentials)
            request.httpBody = jsonData
        } catch {
            self.showError = true
            self.errorMessage = "Error encoding credentials"
            return
        }
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let error = error {
                    self.showError = true
                    self.errorMessage = "Login failed: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.showError = true
                    self.errorMessage = "Invalid response"
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    self.showError = false
                    self.success = true
                    self.authenticated = true
                    self.username = email
                    //self.fullName = name
                }
                else {
                    self.showError = true
                    self.errorMessage = "Login failed: Invalid credentials or server error"
                }
            }
        }.resume()
    }
}

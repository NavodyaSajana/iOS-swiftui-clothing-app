//
//  UserViewModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import Foundation

class UserViewModel : ObservableObject {
    @Published var userData = sampleUserData
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: userData.fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

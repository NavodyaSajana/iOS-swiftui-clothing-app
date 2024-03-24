//
//  UserModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import Foundation

struct UserModel : Hashable {
    var userID: String
    var fullName : String
    var email: String
}

var sampleUserData = UserModel(userID: NSUUID().uuidString, fullName: "Sajana R", email:"sajana@123.lk")


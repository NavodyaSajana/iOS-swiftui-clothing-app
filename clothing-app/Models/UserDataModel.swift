//
//  UserDataModel.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-24.
//

import Foundation

struct UserDataModel : Decodable {
    var id : String
    var name : String
    var email : String
    var password : String
    var telephone : Int
    var age : Int
}

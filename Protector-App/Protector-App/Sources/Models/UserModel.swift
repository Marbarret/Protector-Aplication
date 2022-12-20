//
//  UserModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import Foundation

struct UserModel {
    var givenName,
        email: String?
    var imgUser: URL?
    
    var id: String {
        return "id"
    }
}

struct UserCredential {
    var email: String
    var password: String
    let username: String
}

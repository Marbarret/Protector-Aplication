//
//  AuthenticationService.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 18/12/22.
//

import Foundation
import Firebase

class AuthenticationService {
    
    func loginUser(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let err = error {
                print(err)
            } else {
                
            }
        }
    }
    
}

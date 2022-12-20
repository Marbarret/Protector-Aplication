//
//  FaceAuthenticationService.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 20/12/22.
//

import Foundation
import FacebookLogin
import Firebase

class FaceAuthenticationService {
    
    func loginFaceBook() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.email], viewController: ApplicationUtility.rootViewController) { (result) in
            switch result {
            case .success(granted: let granted, declined: let decline, token: let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? "")
                Auth.auth().signIn(with: credential) { (result, error) in
                    
                }
            case .cancelled: break
            case .failed(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum Provedor: String {
    case basic
    case google
    case facebook
}

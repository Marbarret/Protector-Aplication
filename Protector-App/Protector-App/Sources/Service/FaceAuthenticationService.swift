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
    
    func loginFaceBook(completion: @escaping (Result<Bool, Error>) -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.email], viewController: ApplicationUtility.rootViewController) { (result) in
            switch result {
            case .success(granted: let granted, declined: let decline, token: let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? "")
                Auth.auth().signIn(with: credential) { (result, error) in
                    switch result {
                    case .none:
                        completion(.failure(error?.localizedDescription as! Error))
                    case .some(_):
                        completion(.success(true))
                    }
                }
            case .cancelled: break
            case .failed(let error):
                print(error.localizedDescription)
            }
        }
    }
}

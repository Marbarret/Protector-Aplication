//
//  AuthenticationService.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 18/12/22.
//

import UIKit
import Firebase
import Combine

protocol AuthenticationServiceDelegate {
    func showError(_ message: String)
    func navigateToHomeViewController(_ homeViewController: UIViewController)
}

class AuthenticationService {
    var delegate: AuthenticationServiceDelegate?
    var credential: UserCredential? = UserCredential(email: "", password: "", username: "")
    
    func loginUser(_ credential: UserCredential, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: credential.email, password: credential.password) { (authResult, error) in
            if error != nil  {
                completion(.failure(error?.localizedDescription as! Error))
            } else {
                switch authResult {
                case .none:
                    completion(.failure(error?.localizedDescription as! Error))
                case .some(_):
                    completion(.success(true))
                }
            }
        }
    }
    
    func registerUser(_ credential: UserCredential, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: credential.email, password: credential.password) { (authResult, error) in
            if error != nil  {
                completion(.failure(error?.localizedDescription as! Error))
            } else {
                switch authResult {
                case .none:
                    completion(.failure(error?.localizedDescription as! Error))
                case .some(_):
                    completion(.success(true))
                }
            }
        }
    }
    
    func logoutAuthentication() {
        do {
            try Auth.auth().signOut()
        } catch let signOut as NSError {
            print("Error signing out: %@", signOut)
        }
    }
}

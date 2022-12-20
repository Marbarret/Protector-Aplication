//
//  AuthenticationService.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 18/12/22.
//

import UIKit
import Firebase

protocol AuthenticationServiceDelegate {
    func showError(_ message: String)
    func navigateToHomeViewController(_ homeViewController: UIViewController)
}

class AuthenticationService {
    var delegate: AuthenticationServiceDelegate?
    var credential: UserCredential? = UserCredential(email: "", password: "", username: "")
    
    func loginUser(_ credential: UserCredential) {
        Auth.auth().signIn(withEmail: credential.email, password: credential.password) { (authResult, error) in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.wrongPassword.rawValue:
                
                self.delegate?.showError("Senha incorreta")
            case .some(let error as NSError) where error.code == AuthErrorCode.userNotFound.rawValue:
                
                self.delegate?.showError("Email incorreto")
                
            case .some(let error):
                
                self.delegate?.showError("Login error: \(error.localizedDescription)")
                
            case .none:
                if (authResult?.user) != nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let homeViewController = storyboard.instantiateViewController(identifier: "HomeViewController")
                    self.delegate?.navigateToHomeViewController(homeViewController)
                }
            }
        }
    }
    
    func registerUser(_ credential: UserCredential) {
        Auth.auth().createUser(withEmail: credential.email, password: credential.password) { (authResult, error) in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.weakPassword.rawValue:
                self.delegate?.showError("Senha fraca")
                
            case .some(let error):
                self.delegate?.showError("Register error: \(error.localizedDescription)")
                
            case .none:
                if (authResult?.user) != nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let homeViewController = storyboard.instantiateViewController(identifier: "RegisterViewController")
                    self.delegate?.navigateToHomeViewController(homeViewController)
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


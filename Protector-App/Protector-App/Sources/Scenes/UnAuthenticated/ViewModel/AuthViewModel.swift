//
//  AuthViewModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 21/12/22.
//

import UIKit

class AuthViewModel {
    var credential: UserCredential
    
    var statusLogin: ProviderLog = .unknown
    
    var service: AuthenticationService!
    init(service: AuthenticationService, credential: UserCredential) {
        self.service = service
        self.credential = credential
    }
    
    func signIn() {
        service.loginUser(credential) { (result) in
            switch result {
            case .success:
                self.statusLogin = .basic
                self.service.delegate?.navigateToHomeViewController(WelcomeViewController())
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func register() {
        service.registerUser(credential) { (result) in
            switch result {
            case .success:
                print("Success")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func logout() {
        service.logoutAuthentication()
    }
}

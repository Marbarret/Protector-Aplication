//
//  AuthViewModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 21/12/22.
//

import Foundation

class AuthViewModel {
    var credential: UserCredential
    
    var service: AuthenticationService!
    init(service: AuthenticationService, credential: UserCredential) {
        self.service = service
        self.credential = credential
    }
    
    func signIn() {
        service.loginUser(credential) { (result) in
            switch result {
            case .success:
                self.service.delegate?.navigateToHomeViewController(HomeViewController())
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

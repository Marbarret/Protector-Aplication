//
//  GoogleAuthViewModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 20/12/22.
//

import Foundation

class GoogleAuthViewModel {
    var service: GoogleAuthenticationProtocol!
    init(service: GoogleAuthenticationProtocol) {
        self.service = service
    }

    func signIn() {
        service.signIn { (result) in
            switch result {
            case .success:
                print("Login")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum SignState {
    case signIn
    case signOut
    case unkwond
}

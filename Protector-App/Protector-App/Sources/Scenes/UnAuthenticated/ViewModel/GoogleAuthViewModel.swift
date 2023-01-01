//
//  GoogleAuthViewModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 20/12/22.
//

import Foundation

class GoogleAuthViewModel {
    var provider: ProviderLog = .unknown
    
    var service: GoogleAuthenticationProtocol!
    init(service: GoogleAuthenticationProtocol) {
        self.service = service
    }

    func signIn() {
        service.signIn { (result) in
            switch result {
            case .success:
                self.provider = .google
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        self.service.signOut()
    }
}

enum ProviderLog {
    case basic
    case google
    case facebook
    case unknown
}

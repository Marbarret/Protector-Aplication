//
//  GoogleAuthViewModel.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 20/12/22.
//

import Foundation

class GoogleAuthViewModel {
//    var status: SignState = .signOut
    
//    var service: GoogleAuthenticationProtocol!
//    init(service: GoogleAuthenticationProtocol) {
//        self.service = service
////    }
//    var service: GoogleAuthentication = GoogleAuthentication()
//    func signIn() {
//        
//        service.signIn { (result) in
//            switch result {
//            case .success:
//                print("Login")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}

enum SignState {
    case signIn
    case signOut
    case unkwond
}

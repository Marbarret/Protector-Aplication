//
//  HomeViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    var authViewModel: AuthenticationService = AuthenticationService()
    var authGoogle: GoogleAuthentication = GoogleAuthentication()
//    let provider: Provedor
    
//    init(provider: Provedor) {
//        self.provider = provider
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        authViewModel.logoutAuthentication()
//        switch provider {
//        case .basic:
//            authViewModel.logoutAuthentication()
//        case .google:
//            authGoogle.signOut()
//        case .facebook:
//            break
//        }
        
        navigationController?.popToRootViewController(animated: true)
    }
}

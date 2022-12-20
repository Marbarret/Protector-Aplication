//
//  HomeViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    var authViewModel: AuthenticationService = AuthenticationService()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        authViewModel.logoutAuthentication()
        navigationController?.popToRootViewController(animated: true)
    }
}

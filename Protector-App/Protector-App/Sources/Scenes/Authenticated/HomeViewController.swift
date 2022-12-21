//
//  HomeViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    var authViewModel: AuthViewModel?
    var authGoogle: GoogleAuthentication = GoogleAuthentication()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        authViewModel?.logout()
        navigationController?.popToRootViewController(animated: true)
    }
}

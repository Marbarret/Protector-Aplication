//
//  LoginViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import UIKit
import Firebase
import GoogleSignIn
import Combine

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var activityIndicator: UIActivityIndicatorView!
    var authViewModel: AuthViewModel?
    var authGoogle: GoogleAuthentication = GoogleAuthentication()
    var authFacebook: FaceAuthenticationService = FaceAuthenticationService()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
        loginButton.setTitleColor(.clear, for: .disabled)
    }
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        guard let email = txtFieldEmail.text else {return}
        guard let password = txtFieldPassword.text else {return}
        authViewModel?.credential.email = email
        authViewModel?.credential.password = password
        authViewModel?.signIn()
    }
    
    @IBAction func buttonLoginGoogle(_ sender: UIButton) {
        authGoogle.signIn()
    }
    
    @IBAction func buttonLoginFacebook(_ sender: UIButton) {
        authFacebook.loginFaceBook()
    }
    
    func setupDelegate() {
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
//        authViewModel.delegate = self
    }
    
    fileprivate func setupUI() {
        setActivityIndicator()
        loginButton.isEnabled = false
    }
    
    func setActivityIndicator() -> Void {
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.center = view.center
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
    }

    func displayActivityIndicatorView() -> () {
        self.view.isUserInteractionEnabled = false
        self.view.bringSubviewToFront(self.activityIndicator)
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    fileprivate func updateView() {
        if(validFields()) {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
            loginButton.setTitleColor(.clear, for: .disabled)
        }
    }
    
    func validFields() -> Bool {
        let email = txtFieldEmail.text ?? ""
        let password = txtFieldPassword.text ?? ""
        return Validades.validFields(email: email, password: password)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtFieldEmail {
            updateView()
        } else if textField == self.txtFieldPassword {
            updateView()
        }
        return true
    }
}

extension LoginViewController: AuthenticationServiceDelegate {
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if !self.activityIndicator.isHidden{
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        }
    }
    
    func navigateToHomeViewController(_ homeViewController: UIViewController) {
        
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "UPS!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

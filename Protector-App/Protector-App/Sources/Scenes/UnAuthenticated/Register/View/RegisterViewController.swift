//
//  RegisterViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 19/12/22.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var activityIndicator: UIActivityIndicatorView!
    var authViewModel: AuthViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
        registerButton.setTitleColor(.clear, for: .disabled)
    }
    
    @IBAction func registerPress(_ sender: UIButton) {
        guard let email = txtFieldEmail.text else {return}
        guard let password = txtFieldPassword.text else {return}
        authViewModel?.credential.email = email
        authViewModel?.credential.password = password
        
        authViewModel?.register()
    }
    
    @IBAction func registerGoogle(_ sender: UIButton) {
        
    }
    
    @IBAction func registerFacebook(_ sender: UIButton) {
        
    }
    
    func setupDelegate() {
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
    }
    
    fileprivate func setupUI() {
        setActivityIndicator()
        registerButton.isEnabled = false
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
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
            registerButton.setTitleColor(.clear, for: .disabled)
        }
    }
    
    func validFields() -> Bool {        
        return Validades.validFields(email: checkEmail(), password: checkPassword())
    }
    
    func checkEmail() -> String {
        let email = txtFieldEmail.text ?? ""
        return email
    }
    
    func checkPassword() -> String {
        let password = txtFieldPassword.text ?? ""
        return password
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtFieldEmail {
            updateView()
        } else if textField == self.txtFieldPassword {
            updateView()
        } else if self.txtFieldPassword == self.repeatPassword {
            updateView()
        }
        return true
    }
}

extension RegisterViewController: AuthenticationServiceDelegate {
    func navigateToHomeViewController(_ homeViewController: UIViewController) {
        
    }
    
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
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "UPS!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

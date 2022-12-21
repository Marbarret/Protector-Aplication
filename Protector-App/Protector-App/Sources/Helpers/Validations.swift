//
//  Validations.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 20/12/22.
//

import Foundation
import UIKit
import Combine

class Validades {
    static func validFields(email: String, password: String) -> Bool {
        return isValidEmail(email) && isValidPassword(password)
    }
    
    static func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password.count >= 8
    }
    
    static func isValidEmail(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}

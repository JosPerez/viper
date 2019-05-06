//
//  VwLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit

protocol VwLogin {
    func showHUD()
    func hideHUD()
    func showSuccess()
    func showError(errorMessage: LoginError)
}

enum LoginError: Error {
    case UserInvalid
    case PasswordInvalid
    case Unknown
}

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
    func showContries(info: [contryInfo])
    func showError(errorMessage: LoginError)
    func showAlertWithTextField(title: String, message: String, tableView: UITableViewController, completion:@escaping (_ result: String) -> Void)
    func showImage(image: UIImage)
}
enum LoginError: Error {
    case UserInvalid
    case PasswordInvalid
    case Unknown
}

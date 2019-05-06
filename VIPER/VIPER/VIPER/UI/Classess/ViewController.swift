//
//  ViewController.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//
import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func login() {
        let entidadLogin = Login(user: "", password: "")
        RtgLogin.navigateToMenu(from: self, loginData: entidadLogin)
    }
}
extension ViewController: VwLogin {
    func showHUD() {
        
    }
    
    func hideHUD() {
        
    }
    
    func showSuccess() {
        RtgLogin.navigateToMenu(from: self, loginData: Login(user: "", password: ""))
    }
    
    func showError(errorMessage: LoginError) {
        switch errorMessage {
        case .PasswordInvalid, .UserInvalid:
            print("Mostrar alerta")
        case .Unknown:
            print("Nose que hacer")
        }
    }
    
    
}

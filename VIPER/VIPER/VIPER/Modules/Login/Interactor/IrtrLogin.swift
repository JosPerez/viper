//
//  IrtrLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit
public struct LoginResponse {
    
}
class IrtrLogin: NSObject {
    var presenter: PrstLogin! = PrstLogin()
    func initWithPresenter(presenter: PrstLogin) {
        self.presenter = presenter
    }
    func callWebService(withLoginData: Login) {
        //llamada al servicio
        self.presenter.loginSuccess()
    }
}
extension IrtrLogin {
    func loadData() {
        
    }
}

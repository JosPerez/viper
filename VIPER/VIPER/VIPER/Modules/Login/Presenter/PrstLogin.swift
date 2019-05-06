//
//  PrstLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//
import Foundation
protocol PresenterLogin: class {
    func loginWithData(data: Login)
}
class PrstLogin {
    weak var delegateLogin: PresenterLogin?
    var viewLogin: VwLogin?
    func attachView(view: VwLogin) {
        self.viewLogin = view
    }
    func deattach() {
        self.viewLogin = nil
    }
    func loginSuccess() {
        self.viewLogin?.showError(errorMessage: LoginError.PasswordInvalid)
    }
    func callWebService(withLoginData data: Login) {
        ///Llamamos al interactor.
    }
}

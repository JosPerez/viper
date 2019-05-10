//
//  PrstLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//
import Foundation
protocol PresenterData: class {
    func callWebService(fromApi apiString: String, fields: [String])
}
class PrstLogin {
    weak var delegateLogin: PresenterData?
    var viewLogin: VwLogin?
    var interactor = IrtrLogin()
    func attachView(view: VwLogin) {
        self.viewLogin = view
        interactor.initWithPresenter(presenter: self)
    }
    func deattach() {
        self.viewLogin = nil
    }
    func showError(error: LoginError) {
        self.viewLogin?.showError(errorMessage: error)
    }
    func callWebService(fromApi apiString: String, fields: [String]) {
        if !apiString.isEmpty {
            self.interactor.callWebService(fromApi: apiString, fields: fields)
        } else {
            self.showError(error: .UserInvalid)
        }
    }
}
extension PrstLogin: interactorData {
    func showContries(info: [contryInfo]) {
        self.viewLogin?.showContries(info: info)
    }
    
    
}

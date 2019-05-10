//
//  IrtrLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit
protocol interactorData: class {
     func showContries(info: [contryInfo])
}
class IrtrLogin: NSObject {
    var presenter: PrstLogin?
    func initWithPresenter(presenter: PrstLogin) {
        self.presenter = presenter
    }
    
    
}
extension IrtrLogin: PresenterData {
    func callWebService(fromApi apiString: String, fields: [String]) {
        var urlString = apiString
        if !fields.isEmpty {
            urlString = apiString + "?fields="
            for field in fields {
                urlString = urlString + field + ";"
            }
            urlString.removeLast(1)
        }
        guard let url = URL(string: urlString) else {
            print("No es una URL")
            return
        }
        var contryData = [contryInfo]()
        URLSession.shared.dataTask(with: url, completionHandler: { (data,response,error) in
            DispatchQueue.main.async {
                guard let parseData = data else {
                    print("No se pudo obtener data")
                    self.presenter?.showError(error: .PasswordInvalid)
                    return
                }
                do {
                    //let json  = try JSONSerialization
                    let decoder = JSONDecoder()
                    contryData = try decoder.decode([contryInfo].self, from: parseData)
                    self.presenter?.showContries(info: contryData)
                }catch {
                    print("error = ", error)
                    self.presenter?.showError(error: .Unknown)
                }
            }
        }).resume()
    }
}

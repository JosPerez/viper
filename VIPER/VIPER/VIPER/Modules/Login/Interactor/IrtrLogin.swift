//
//  IrtrLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit
import WebKit
protocol interactorData: class {
    func showContries(info: [contryInfo])
    func showFlagImage(image: UIImage)
}
class IrtrLogin: NSObject {
    var presenter: PrstLogin?
    fileprivate var apiKey = "qnRZqW1yu0urriAYC3l9fdwKMtINUTMA5Wo8FtPEFDx7CNArAvyuz3XHLTZFs6EV"
    func initWithPresenter(presenter: PrstLogin) {
        self.presenter = presenter
    }
}
extension IrtrLogin: PresenterData {
    func getImage(withURL urlString: String) {
        let postUrl = "https://api.cloudconvert.com/v1/convert?apikey=" + apiKey + "&inputformat=svg&outputformat=jpg&input=download&file=" + urlString + "&filename=flag.svg&wait=true"
        guard let url = URL(string: postUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            if let image = UIImage(data: data) {
                self.presenter?.showFlagImage(image: image)
            }
        }.resume()
    }
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
                    print("error1 = ", error)
                    self.presenter?.showError(error: .Unknown)
                }
            }
        }).resume()
    }
}

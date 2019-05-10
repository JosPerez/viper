//
//  ViewController.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//
import UIKit
class ViewController: UITableViewController {
    let opciones = ["Todos los paises soportados", "Escoge un pais para ver detalles"]
    let presenter = PrstLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.attachView(view: self)
    }
    func login() {
        //let entidadLogin = Login(user: "", password: "")
        //RtgLogin.navigateToMenu(from: self, loginData: entidadLogin)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        cell.textLabel?.text = opciones[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let url = "https://restcountries.eu/rest/v2/all"
            self.presenter.callWebService(fromApi: url, fields: ["name","capital"])
        }else  {
            showAlertWithTextField(title: "Buscar pais", message: "Introduce el texto", tableView: self, completion:{
                result in
                print(result)
                let url = "https://restcountries.eu/rest/v2/name/"+result
                self.presenter.callWebService(fromApi: url, fields: ["name","capital","languages"])
            })
        }
    }
}
extension ViewController: VwLogin {
    func showContries(info: [contryInfo]) {
        if info.count > 1 {
            RtgLogin.navigateToCountryList(from: self, loginData: info)
        }else {
            RtgLogin.navigateToDetailView(from: self, info: info[0])
        }
    }
    func showHUD() {
        
    }
    
    func hideHUD() {
        
    }
    func showError(errorMessage: LoginError) {
        switch errorMessage {
        case .PasswordInvalid, .UserInvalid:
            print("Mostrar alerta")
        case .Unknown:
            print("Nose que hacer")
        }
    }
    /**
     Función para mostrar un alerta con textfield que regresa el texto capturado
     */
    func showAlertWithTextField(title: String, message: String, tableView: UITableViewController, completion:@escaping (_ result: String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Texto..."
        })
        let alertAction = UIAlertAction(title: "Buscar", style: .default, handler: { _ in
            let textField = alert.textFields?[0]
            completion(textField?.text ?? "")
        })
        alert.addAction(alertAction)
        tableView.present(alert, animated: true, completion: nil)
    }
}

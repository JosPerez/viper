//
//  CountryTableViewController.swift
//  VIPER
//
//  Created by BRM12444 on 5/9/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
    var countryList = [contryInfo]()
    let presenter = PrstLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lista de paises"
        presenter.attachView(view: self)
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = countryList[indexPath.row].name
        cell.detailTextLabel?.text = countryList[indexPath.row].capital
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let imgString = countryList[indexPath.row].flag {
            createSpinnerView()
            self.presenter.getImage(fromURL: imgString)
        } else {
            print("Not flag")
            createSpinnerView()
            RtgLogin.navigateToDetailView(from: self, info: countryList[indexPath.row], flagImage: nil)
        }
    }
}
extension CountryTableViewController: VwLogin {
    func showHUD() {
    }
    
    func hideHUD() {
    }
    
    func showContries(info: [contryInfo]) {
    }
    
    func showError(errorMessage: LoginError) {
    }
    
    func showAlertWithTextField(title: String, message: String, tableView: UITableViewController, completion: @escaping (String) -> Void) {
    }
    
    func showImage(image: UIImage) {
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        RtgLogin.navigateToDetailView(from: self, info: countryList[row], flagImage: image)
    }
    func createSpinnerView() {
        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}
class SpinnerViewController: UITableViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

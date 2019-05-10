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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Paises"
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = countryList[indexPath.row].name
        cell.detailTextLabel?.text = countryList[indexPath.row].capital
        return cell
    }
}

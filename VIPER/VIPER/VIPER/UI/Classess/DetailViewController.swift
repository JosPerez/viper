//
//  DetailViewController.swift
//  VIPER
//
//  Created by BRM12444 on 5/9/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak fileprivate var lblNombre: UILabel!
    @IBOutlet weak fileprivate var lblCapital: UILabel!
    @IBOutlet weak fileprivate var lblIdioma: UILabel!
    var countryInfo:contryInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text = countryInfo?.name
        lblCapital.text = countryInfo?.capital
        lblIdioma.text = countryInfo?.languages?[0].nativeName
        // Do any additional setup after loading the view.
    }

}

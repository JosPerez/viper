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
    @IBOutlet weak fileprivate var imgFlag: UIImageView!
    var countryInfo:contryInfo?
    var imageFlag:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text = countryInfo?.name
        lblCapital.text = countryInfo?.capital
        lblIdioma.text = countryInfo?.languages?[0].nativeName
        imgFlag.image = imageFlag
        navigationItem.title = "Vista detalle"
    }
}

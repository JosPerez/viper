//
//  RtgLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit

class RtgLogin: NSObject {
    static func navigateToCountryList(from: UIViewController, loginData: [contryInfo]) {
        let countryView = CountryTableViewController()
        countryView.countryList = loginData
        from.navigationController?.pushViewController(countryView, animated: true)
    }
    static func navigateToDetailView(from: UIViewController, info: contryInfo) {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        detailView.countryInfo = info
        from.navigationController?.pushViewController(detailView, animated: true)
    }
}

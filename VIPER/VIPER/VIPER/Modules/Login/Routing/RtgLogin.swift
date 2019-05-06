//
//  RtgLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit

class RtgLogin: NSObject {
    static func navigateToMenu(from: UIViewController, loginData: Login) {
        from.navigationController?.pushViewController(ViewController(nibName: "ViewController", bundle: Bundle.main), animated: true)
    }
    static func sendBack(from: UIViewController) {
        
    }
}

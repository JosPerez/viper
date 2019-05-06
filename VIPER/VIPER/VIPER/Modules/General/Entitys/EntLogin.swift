//
//  EntLogin.swift
//  VIPER
//
//  Created by Abraham Abreu on 5/6/19.
//  Copyright © 2019 banregio. All rights reserved.
//

import UIKit
/**
 Entidad que nos permite enviar datos del login a un servicio.
 */
public struct Login {
    ///Valor para el campo de usuario.
    var user: String? = nil
    ///Valor para el campo de password.
    var password: String? = nil
    /**
     Método que inicia la entidad login.
     - parameter user: Usuario.
     - parameter password: Contraseña.
     */
    init(user: String?, password: String?) {
        self.user = user
        self.password = password
    }
}

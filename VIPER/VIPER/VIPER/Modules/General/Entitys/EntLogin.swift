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
public struct contryInfo: Codable {
    ///Enum para todos los campos requeridos y soportados
    enum  contryFields: CodingKey {
        case name
        case callingCodes
        case capital
        case region
        case subregion
        case population
        case languages
        case flag
    }
    ///Nombre del pais
    var name:String?
    ///Codigo para marcar
    var callingCodes:[String]?
    ///Capital del pais
    var capital:String?
    ///Region a la que pertenece el pais
    var region:String?
    ///Sub region a la que pertence el pais
    var subregion:String?
    ///Poblacion total del pais
    var population:Int?
    ///Lenguajes que se hablan a en el pais
    var languages:[lenguaje]?
    ///Bandera del pais
    var flag:String?
}
/**
 Entidad para obtener nombre e ISO del idioma
 */
public struct lenguaje: Codable {
    ///Enum con los codigos de idioma
    enum codigoIdioma: String, CodingKey {
        case nativeName = "nativeName"
    }
    ///Como se abrevia el idioma
    var iso:String?
    ///El nombre del idioma real
    var nativeName:String?
    ///init del decoder
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: codigoIdioma.self)
        nativeName = try values.decode(String.self, forKey: .nativeName)
    }
}

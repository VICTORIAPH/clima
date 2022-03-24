//
//  ClimaModelo.swift
//  Clima
//
//  Created by Mac8 on 24/03/22.
//

import Foundation

struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let temperatura: Double
    
    //propiedad compuitada
    var temperaturaString: String{
        return String(format: "%.1f", temperatura)
    }
    var nombreCondicion: String{
        switch condicionID {
        case 200...232:
            return "could.bolt"
            
        case 300...351:
            return "could.bolt.fill"
            
        case 400...451:
            return "snow"
            
        case 500...551:
            return "could.bolt.rain"
            
        case 600...650:
            return "sun.max"
            
        case 700...721:
            return "sun.min"
            
        case 800:
            return "cloud"
        case 801...804:
            return "could.fill"
            
        
        default:
            return "cloud"
        }
    }
    
}

//
//  DatosClima.swift
//  Clima
//
//  Created by Mac8 on 24/03/22.
//

import Foundation

struct DatosClima: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}
//es decodable para poder extraer
struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Int?
}

struct Weather: Decodable{
    let id: Int
}

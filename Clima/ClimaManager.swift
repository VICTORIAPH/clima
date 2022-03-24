//
//  ClimaManager.swift
//  Clima
//
//  Created by Mac8 on 23/03/22.
//

import Foundation
struct ClimaManager {
    
    let climaURL = ""
    
    func obtenerClima(nombreCiudad: String)
    {
        let urlString = "\(climaURL)&q\(nombreCiudad)"
        print(urlString)
        
    }
}

func realizarSolicitud(urlString: String) {
    //1,- crear URL
    if let url = URL(string: urlString){
    // 2.- crear una urlSession
    let session =  URLSession(configuration: .default)
        // 3.- Asignar una tarea a la sesion
        let tarea = session.dataTask(with: url){
            datos, respuesta, error in
            if error != nil {
                print(error?.localizedDescription ?? "Errror al consumir la appi")
                return
            }
            //si no hubo errores
            if let datosSeguros = datos{
                analizarJSON(datosClima: datosSeguros)
            }
        }
    
}
    func analizarJSON(datosClima: Data){
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try decodificador.decode(DatosClima.self, from: datosClima)
            //print(datosDecodificados.name)
            //print(datosDecodificados.main.temp)
            //print(datosDecodificados.weather[0].id)
            
            let condicionId =  datosDecodificados.weather[0].id
            let nombreCiudad = datosDecodificados.name
            let temperatura = datosDecodificados.main.temp
            let humedad = datosDecodificados.main.humidity ?? 20
            
            var objClimaModelo  = ClimaModelo(condicionID: condicionId, nombreCiudad: nombreCiudad, temperatura: temperatura, humedad: humedad)
            
            
        }catch{
            print(error)
        }
       
    }

func controlFinalizacion(datos: Data?, respuesta: URLResponse?, error: Error? )  {
    
    if error != nil{
        print("Error")
        return
    }
}
    
}

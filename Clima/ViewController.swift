//
//  ViewController.swift
//  Clima
//
//  Created by Mac8 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imagenClima: UIImageView!
    @IBOutlet weak var fondoClima: UIImageView!
    @IBOutlet weak var mensajeTempLabel: UILabel!
    @IBOutlet weak var temperaturaClima: UILabel!
    
    @IBOutlet weak var nombreCiudadTextField: UITextField!
    
    //cream,os el objeto de clama manager
    var climaManager = ClimaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fondoClima.image = UIImage(named: "nubes")
    }

    @IBAction func buscarBtn(_ sender: UIButton) {
        print("nombre ciudad \(nombreCiudadTextField.text)")
        //llamar la api e imprima el nombre de la cuidad
        
        
    }
    
    @IBAction func ubicacionBtn(_ sender: UIButton) {
        print("se obtuvieron cordenadas del gps del dispositivo")
    }
    //MARK: - METODO DEL UITEXTFIELD
       
   //identificar si presiona el boton del teclado virtual
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       //  print("boton presionado")
       // print(nombreCiudadTextField.text ?? "")
        nombreCiudadTextField.endEditing(true)
        return true
    }
    // identifica cuando el usuario termino de editar y se pùede borrar el contenido del texfield
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        //hacer la llamada a la api
        climaManager.obtenerClima(nombreCiudad: nombreCiudadTextField.text ?? "Morelia")
    }
    
    
    // evitar que el usuario no escriba nada
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if nombreCiudadTextField.text != "" {
            return true
            //significa que efectiva,emte el usuario escribio algo
            
        }else {
            print("necesitas escribir el nombre de la ciudad")
            mensajeTempLabel.text = "Necesita escribir el nombre de una ciudad"
            nombreCiudadTextField.placeholder = "Necesitas escribir el nopmbre de una ciudad"
            return false
        }
    }
    
    
}


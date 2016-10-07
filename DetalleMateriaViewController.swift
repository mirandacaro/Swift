//
//  detalleMateriaViewController.swift
//  table
//
//  Created by Maestro on 29/09/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit

class DetalleMateriaViewController: UIViewController {
    
    var alumno : Alumno?
    var materia : Materia?
    
    @IBOutlet weak var lblMateria: UILabel!
    
    @IBOutlet weak var lblNombreAlumno: UILabel!
    
    @IBOutlet weak var lblParcialUno: UILabel!
    
    @IBOutlet weak var lblParcialDos: UILabel!
    
    @IBOutlet weak var lblParcialTres: UILabel!
    
    
    override func viewDidLoad() {
        lblMateria.text = materia!.nombre
        lblNombreAlumno.text = "\(alumno!.nombre) \(alumno!.apellidos)"
        
        if let calificacionPrimerParcial = materia!.calificacionPrimerParcial{
            lblParcialUno.text = String(calificacionPrimerParcial)
        }
        if let calificacionSegundoParcial = materia!.calificacionSegundoParcial{
            lblParcialDos.text = String(calificacionSegundoParcial)
        }
        
        if let calificacionTercerParcial = materia!.calificacionTercerParcial{
            lblParcialTres.text = String(calificacionTercerParcial)
        }
        
        

    }

}
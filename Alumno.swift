//
//  Alumno.swift
//  table
//
//  Created by Maestro on 23/09/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit

class Alumno {
    
    var nombre: String
    var apellidos : String
    var matricula : String
    var carrera : String
    var telefono : String?
    var direccion : String?
    var foto : String?
    var imgFoto : UIImage?
    
    var materias : [Materia] // tiene un arreglo tipo materia
    
    init(nombre:String, apellidos: String, matricula: String, carrera: String){
        
        self.nombre = nombre
        self.apellidos = apellidos
        self.matricula = matricula
        self.carrera = carrera
        
        self.materias = []
        
    }
    
    init(nombre:String, apellidos: String, matricula: String, carrera: String, foto: String){
        
        self.nombre = nombre
        self.apellidos = apellidos
        self.matricula = matricula
        self.carrera = carrera
        
        self.foto = foto
        imgFoto = UIImage(named: foto)
        
        self.materias = []
        
    }
    
    
    init(nombre:String, apellidos: String, matricula: String, carrera: String, foto: String, direccion: String, telefono: String){
        
        self.nombre = nombre
        self.apellidos = apellidos
        self.matricula = matricula
        self.carrera = carrera
        self.direccion = direccion
        self.telefono = telefono
        
        self.foto = foto
        imgFoto = UIImage(named: foto)
        
        self.materias = []
        
    }
    
}


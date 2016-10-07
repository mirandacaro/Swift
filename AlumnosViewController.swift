//
//  AlumnosController.swift
//  table
//
//  Created by Maestro on 23/09/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit

class AlumnoController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tvAlumnos: UITableView!
    
    var alumnos : [Alumno] = [] // quiero una variable alumno del tipo arreglo de alumno e inicializalo y esta contenida en este viewcontroller. 
    // alumnos a su vez tiene un arreglo de materias
    
    override func viewDidLoad() {
        self.title = "Alumnos"
        
        // aqui hay un constructor
        // btw otra manera de hacerlo es : alumnos.append(Alumno(nombre: "José", apellidos: "Perez", matricula: "2312"... etc)
        
        /* codigo AAA */
        
        let alumno1 = Alumno(nombre: "Dragonite", apellidos: "Gonzalez", matricula: "159085", carrera: "IMP", foto: "1")
        alumnos.append(alumno1) 
        
        let alumno2 = Alumno(nombre: "Bulbasur", apellidos: "Gonzalez", matricula: "159086", carrera: "IMP", foto: "2")
        alumnos.append(alumno2)
        
        let alumno3 = Alumno(nombre: "Squirtle", apellidos: "Gonzalez", matricula: "159087", carrera: "IMP", foto: "3")
        alumnos.append(alumno3)
        
        let alumno4 = Alumno(nombre: "Pikachu", apellidos: "Gonzalez", matricula: "159088", carrera: "IMP", foto: "4")
        alumnos.append(alumno4)
        
        let alumno5 = Alumno(nombre: "Togepi", apellidos: "Gonzalez", matricula: "159089", carrera: "IMP", foto: "5")
        alumnos.append(alumno5)
        
        alumnos[0].materias.append(Materia(nombre: "Matematicas")) // el primer alumno tiene matematicas
        alumnos[0].materias[0].calificacionPrimerParcial = 10
        alumnos[0].materias[0].calificacionSegundoParcial = 10
        alumnos[0].materias[0].calificacionTercerParcial = 9

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count // contar de manera dinamica el numero de elementos que hay en alumnos ... que seran representados como renglones
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCellWithIdentifier("celdaAlumno") as! CeldaAlumnoController
        // as con signo de interrogacion es que le aseguras que celdaAlumno puede transformarse en tipo celdaAlumnoController, estamos haciendo un casting 
        
        celda.lblNombreAlumno.text = alumnos[indexPath.row].nombre + " " + alumnos[indexPath.row].apellidos
        celda.lblMatricula.text = alumnos[indexPath.row].matricula
        celda.lblCarrera.text = alumnos[indexPath.row].carrera
        celda.imgFoto.image = alumnos[indexPath.row].imgFoto
        
        return celda
    
    }
    
    // se ejecuta despues de que des el click para que se renderee un nuevo viewController y antes de que se cree su instancia y aqui ponemos
    // lo que va a llevar la nueva instancia
    
    // prepare for segue pretende preparar para ejecutar el segue (un cambio de ventanas)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // que sigue se esta ejecutando? ( lo obtienes de los parametros de la funcion.. UIStoryboardsegue)
        if segue.identifier == "goToMaterias" { // en caso de que sea el sigue de materias entonces... 
            
            // lo haces para tener acceso a traves de la variable materiasController a los elementos del destino
            // que es en este caso un ViewControlle
            let materiasController = segue.destinationViewController as! ViewController // haces un casting
            
            // el alumno que seleccione , obten el indice,
            materiasController.alumno = alumnos[tvAlumnos.indexPathForSelectedRow!.row]  // alumno en la posicion seleccionada de la tabla va a ser ahora igual a materiaController
        }
    
    }
}

// PASOS 1 HICIMOS UNA CLASE LLAMADA ALUMNOCONTROLLER-..... creamos table view...  agregamos celda al table view... con estilo personalizado... en style va a decir custom.. a esta celfda le ponemos cuantos elementos queramos... para poder modificar los valores de esas etiquetas necesitamos outlets, por lo que necesitamos crear una clase y y vincularla con celdaalumnocontroller, dicha clase hereda uitableviewcell. cellforrowindex path construye la celda. celdaAlumno es el identificador y lo escogio el profe. dequegue es una funcion que tienen los tableviews, y le dice, que traiga la celda que se llama celdaAlumno. 


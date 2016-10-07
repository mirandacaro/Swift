//
//  ViewController.swift
//  table
//
//  Created by Maestro on 22/09/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var alumno : Alumno? // el alumno contiene materias
    
    /* esta cura dejo de ser utilizada a causa del codigo  AAA
    let materiasx = ["Tratamiento de imagen", "Animacion I", "PSC", "Dispositivos moviles", "Redes de computadora", "Mexico en el contexto global","Mercadotecnia"] */
    
    
    @IBOutlet weak var tvMaterias: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title="Mi tabla"
        
    /* es una manera muy generica ya no es parte del codigo
         
        materias.append(Materia(nombre: "Tratamiento de imagen"))
        materias.append(Materia(nombre: "Animacion I", descripcion: "Para hacer cositas 3D"))
        materias.append(Materia(nombre: "PSC"))
        materias.append(Materia(nombre: "Dispositivos moviles"))
        materias.append(Materia(nombre: "Redes de computadora"))
        materias.append(Materia(nombre: "Mexcio en el contexto global"))
        materias.append(Materia(nombre: "Mercadotecnia"))
    */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView)-> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumno!.materias.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let celda = tvMaterias.dequeueReusableCellWithIdentifier("celdaMateria")
        celda?.textLabel?.text = alumno!.materias[indexPath.row].nombre
        
        // no se por que esta esto aqui DetalleMateriaViewController.
        
        return celda!
    }
    
    // Delegate no esta
    
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    
        if segue.identifier == "goToDetalleMateria" { // destination controller es -> hacia donde vas
            let detalleMateriaController = segue.destinationViewController as! DetalleMateriaViewController // haces un casting
            
        // en esta parte ya debes controlar los elementos del nuevo view controller... 
            
            detalleMateriaController.alumno = alumno
            detalleMateriaController.materia = alumno?.materias[tvMaterias.indexPathForSelectedRow!.row]
            

        }
    
    }
    
}


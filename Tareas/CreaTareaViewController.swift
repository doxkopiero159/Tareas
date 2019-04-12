//
//  CreaTareaViewController.swift
//  Tareas
//
//  Created by piero  acxel on 11/04/19.
//  Copyright © 2019 piero  acxel. All rights reserved.
//

import UIKit

class CreaTareaViewController: UIViewController {

    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    var  anterioVC = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   

    @IBAction func agregar(_ sender: Any) {
        let  tarea = Tarea()
        tarea.nombre=txtNombreTarea.text!
        tarea.importante=swImportante.isOn
        anterioVC.tareas.append(tarea)
        anterioVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    

}

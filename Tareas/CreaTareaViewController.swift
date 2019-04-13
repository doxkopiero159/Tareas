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
    
    //var  anteriorVC = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   

    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let tarea = Tarea(context: context)
        tarea.nombre=txtNombreTarea.text!
        tarea.importante=swImportante.isOn
        //anteriorVC.tareas.append(tarea)
        //anteriorVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    

}

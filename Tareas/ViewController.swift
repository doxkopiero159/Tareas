

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var  tareas:[Tarea] = []
    var indexSeleccionado = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tareas = createTareas()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
      
        if  tarea.importante{
            
            cell.textLabel?.text="💀\(tarea.nombre!)"
        }else{
        cell.textLabel?.text = tarea.nombre!
        
        }
        
        
        return cell
        
        
    }
    override  func  viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSelecionadaSegue", sender: tarea)
        
        
    }
    //func createTareas() -> [Tarea] {
        
       //let tarea1 = Tarea()
        //tarea1.nombre="pasear al perro"
        //tarea1.importante = false
        //let tarea2 = Tarea()
        //tarea2.nombre="comprar  verduras"
        //tarea2.importante = true
        //let tarea3 = Tarea()
        //tarea3.nombre="lavar  los servicios"
       // tarea3.importante = false
        
        
        //return[tarea1,tarea2,tarea3]
   
  // }
    
    
    
    
    @IBAction func agregarTarea(_ sender: Any) {
        
        
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas()  {
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        do{
            tareas = try context.fetch(Tarea.fetchRequest())as![Tarea]
        } catch{
            print("ha ocurido un  error")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
       // if segue.identifier == "agregarSeguer" {
            
         //   let  siguienteVC = segue .destination as! CreaTareaViewController
           // siguienteVC.anteriorVC = self
            
       // }
        
        if segue.identifier == "tareaSelecionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
            siguienteVC.anteriorVC = self
         
        }
        
        
        
    }
    
    
}


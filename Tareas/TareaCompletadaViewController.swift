
import UIKit

class TareaCompletadaViewController: UIViewController  {

    @IBOutlet weak var tareaLabel: UILabel!
    var tarea : Tarea? = nil
   var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tarea!.importante{
            tareaLabel.text = "👻\(tarea!.nombre)"
        }else{
            tareaLabel.text = tarea!.nombre!
        }
        
        
 
        
  }
    @IBAction func completarTarea(_  sender: Any){
        
        let context = (UIApplication.shared.delegate  as! AppDelegate).persistentContainer.viewContext
          context.delete(tarea!)
        (UIApplication.shared.delegate as!AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
        
        anteriorVC.tareas.remove(at:anteriorVC.indexSeleccionado)
        anteriorVC.tableView.reloadData()
        
    }
    


  
    

}

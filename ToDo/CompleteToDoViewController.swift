//
//  CompleteToDoViewController.swift
//  ToDo
//
//  Created by Rob McDonnell on 10/2/17.
//  Copyright © 2017 Rob McDonnell. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if selectedToDo.important {
 //           titleLabel.text = "‼️" + selectedToDo.name
  //      } else {
            titleLabel.text = selectedToDo?.name
    }

    
    @IBAction func completeTapped(_ sender: Any) {

       if let context = (UIApplication.shared.delegate as?
        AppDelegate)?.persistentContainer.viewContext {
        
        if let theToDo = selectedToDo{
        
        context.delete(theToDo)
            
            navigationController?.popViewController(animated: true)
            
        }
        }
        
        
        
        
/*        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
      }
*/
        
    }
    
}

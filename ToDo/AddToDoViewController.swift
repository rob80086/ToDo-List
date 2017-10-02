//
//  AddToDoViewController.swift
//  ToDo
//
//  Created by Rob McDonnell on 10/2/17.
//  Copyright © 2017 Rob McDonnell. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantButton: UISwitch!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
       
        
        /*
        let toDo = ToDo()
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantButton.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
        */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantButton.isOn
        }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        
        
        
    }
    
}
}

//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Rob McDonnell on 10/2/17.
//  Copyright © 2017 Rob McDonnell. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
         if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            
             if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as?
                [ToDoCoreData] {
                if let theToDos = coreDataToDos {
                    toDos = theToDos
                    tableView.reloadData()
                }
            }
            
            
        }
    }
    
    
    func createToDos() -> [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy eggs"
        eggs.important = true
        
        let cheese = ToDo()
        cheese.name = "Eat cheese"
        cheese.important = false // You don't HAVE to say false if the default value is false
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        dog.important = false // You don't HAVE to say false if the default value is false
        
        return [eggs, cheese, dog]
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
        
        if toDo.important {
            cell.textLabel?.text = "‼️" + name
        } else {
            cell.textLabel?.text = toDo.name
        }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
         
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            
            if let toDo = sender as? ToDoCoreData {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self 
            }
        }
        
    }
}

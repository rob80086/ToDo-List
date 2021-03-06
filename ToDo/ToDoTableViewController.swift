//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Rob McDonnell on 10/2/17.
//  Copyright © 2017 Rob McDonnell. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = createToDos()
        
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
        
        if toDo.important {
            cell.textLabel?.text = "‼️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
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
            
            if let toDo = sender as? ToDo {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self 
            }
        }
        
    }
}

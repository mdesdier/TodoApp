//
//  TodoTableViewController.swift
//  Todo List 1
//
//  Created by tester on 11/12/18.
//  Copyright © 2018 Tepo Labs. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todos = createToDos()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //override func numberOfSections(in tableView: UITableView) -> Int {
    //    // #warning Incomplete implementation, return the number of sections
    //    return 0
    //}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count  //one row per todo item
    }

    //temp function to create some items internally for now
    func createToDos() -> [ToDo] {  //return array of ToDo objects
        let eggs = ToDo()
        eggs.name = "Buy eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        
        let cheese = ToDo()
        cheese.name = "Eat some cheese"
        
        return [eggs, dog, cheese]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let todo = todos[indexPath.row] // get a todo from array based on selected row
        
        // Configure the cell...
        if todo.important {
            cell.textLabel?.text = "❗️" + todo.name
        } else {
            cell.textLabel?.text = todo.name
            
        }
            
        return cell
    }
    
    // // add to know when cell in table is clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row] // get a todo from array based on selected row
        performSegue(withIdentifier: "moveToShow", sender: todo)
        
    }
  



    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddToDoViewController {
            //if let succeeded here then we are in segue of move to add
            addVC.previousVC = self //access property in dest view controller and give it pointer to this VC (self)
        }
        
        if let showVC = segue.destination as? ShowTodoViewController {
           
            if let todo = sender as? ToDo {
                showVC.selectedToDo = todo
                showVC.previousToDoVC = self
            }
        }

    }
    

}

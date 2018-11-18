//
//  TodoTableViewController.swift
//  Todo List 1
//
//  Created by tester on 11/12/18.
//  Copyright © 2018 Tepo Labs. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todos : [ToDoCoreData] = []
    
    override func viewDidLoad() { //only gets called once at start
        super.viewDidLoad()

        //todos = createToDos()
        
        //getToDos()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
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
    //no longer used
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
    
    //fetch data from core data
    func getToDos() {
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTodos = try? myContext.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                if let theTodos = coreDataTodos { //have to unwrap twice
                    print(theTodos.first?.name)
                    todos = theTodos    //put it in our todo array
                    tableView.reloadData()
                }
            }//gets all todo objects stored in core data.  return as array of todos
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let todo = todos[indexPath.row] // get a todo from array based on selected row
        
        
        if let name = todo.name { //need to unwrap first
            // Configure the cell...
            if todo.important {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = todo.name
                
            }
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
           
            if let todo = sender as? ToDoCoreData {
                showVC.selectedToDo = todo
                showVC.previousToDoVC = self
            }
        }

    }
    

}

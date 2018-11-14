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
        let todo = todos[indexPath.row] // get a todo from array based on row
        
        // Configure the cell...
        if todo.important {
            cell.textLabel?.text = "❗️" + todo.name
        } else {
            cell.textLabel?.text = todo.name
            
        }
            
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let addVC = segue.destination as! AddToDoViewController
        addVC.previousToDoVC = self //access property in dest view controller and give it pointer to this VC (self)
    
    }
    

}

//
//  ShowTodoViewController.swift
//  Todo List 1
//
//  Created by tester on 11/15/18.
//  Copyright © 2018 Tepo Labs. All rights reserved.
//

import UIKit

class ShowTodoViewController: UIViewController {

    @IBOutlet weak var TodoLabel: UILabel!
    
    var previousToDoVC = TodoTableViewController()  //pointer to previous VC that called us
    var selectedToDo : ToDoCoreData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        TodoLabel.text = selectedToDo?.name  //label accepts string optional directly so no unwrapping needed
        
    }
    
    @IBAction func TodoComplete(_ sender: Any) {
        //complete button clicked
        
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theTodo = selectedToDo {
                myContext.delete(theTodo)
                navigationController?.popViewController(animated: true)  //go back to previous vc
            }
        }
        
        /*   no longer need to go through array to delete item
        var index = 0
        for toDo in previousToDoVC.todos {
            if toDo.name == selectedToDo.name {
                print("we found it..\(toDo.name)")
                previousToDoVC.todos.remove(at: index)
                previousToDoVC.tableView.reloadData()   //refresh data so it shows with deleted row
                navigationController?.popViewController(animated: true)  //go back to previous vc
                break
            }
            index += 1  //keep track of where we are in array as we go through it
 
            
          }        //delect the selected todo from array
        */
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

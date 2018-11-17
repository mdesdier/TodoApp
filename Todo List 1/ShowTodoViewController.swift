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
    var selectedToDo = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TodoLabel.text = selectedToDo.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TodoComplete(_ sender: Any) {
        //complete button clicked
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

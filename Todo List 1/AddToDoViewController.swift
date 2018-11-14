//
//  AddToDoViewController.swift
//  Todo List 1
//
//  Created by tester on 11/12/18.
//  Copyright © 2018 Tepo Labs. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var todoName: UITextField!
    @IBOutlet weak var todoImportant: UISwitch!
    
    var previousToDoVC = TodoTableViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func todoAddTapped(_ sender: Any) {
        let todo = ToDo()
        todo.name = todoName.text!
        todo.important = todoImportant.isOn
        
        previousToDoVC.todos.append(todo) //access array from table view contoller and add new todo item to it.
        previousToDoVC.tableView.reloadData()  // table VC needs to reload data so newly added element shows up in table
        navigationController?.popViewController(animated: true)  //pop means go back to last VC that called us
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
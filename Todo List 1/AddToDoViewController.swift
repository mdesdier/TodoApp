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
    
    var previousVC = TodoTableViewController()  //will use as reference to previous vc that we came from
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func todoAddTapped(_ sender: Any) {
     
        /*
        let todo = ToDo()
        if let nameunwrapped = todoName.text { // unwrap to tmp in case todoName.text is nil we dont crash
            todo.name = nameunwrapped
        }
        todo.important = todoImportant.isOn
        
        previousVC.todos.append(todo) //access array from table view contoller and add new todo item to it.
        previousVC.tableView.reloadData()  // table VC needs to reload data so newly added element shows up in table
        navigationController?.popViewController(animated: true)  //pop means go back to last VC that called us
         */
        
        //add new todo to core data
        //get my app delegate for context (bridget between my app and core data)
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let todo = ToDoCoreData(entity: ToDoCoreData.entity() , insertInto: myContext)
            if let nameunwrapped = todoName.text { // unwrap to tmp in case todoName.text is nil we dont crash
                todo.name = nameunwrapped
            }
            todo.important = todoImportant.isOn
            
            try? myContext.save()    //save to core data

            //don't need to access the old todo array on the man VC since we are saving direct to core data
            navigationController?.popViewController(animated: true)  //pop means go back to last VC that called us

        }
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

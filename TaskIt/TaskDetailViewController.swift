//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Marc Gugliuzza on 9/28/14.
//  Copyright (c) 2014 77th Street Labs. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel:TaskModel! // ! means pass the actual value, not an optional
    
    var mainVC:ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        // pop off the current view controller (remove current view Controller)
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
        
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
        //self.mainVC.taskArray
        
        var task = TaskModel(task: self.taskTextField.text, subtask: self.subtaskTextField.text, date: self.dueDatePicker.date, isCompleted: false)
        
        self.mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
}

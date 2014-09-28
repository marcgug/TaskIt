//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Marc Gugliuzza on 9/28/14.
//  Copyright (c) 2014 77th Street Labs. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        // not inside a navigation controller stock, so we need to pop to previous nav controller a different way
        self.dismissViewControllerAnimated(true, completion: nil)        
        
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        var task = TaskModel(task: self.taskTextField.text, subtask: self.subtaskTextField.text, date: self.dueDatePicker.date, isCompleted: false)
        
        self.mainVC.baseArray[0].append(task)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
}

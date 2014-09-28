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
        
        let appDelegate = (UIApplication.sharedApplication().delegate) as AppDelegate
        
        detailTaskModel.task = self.taskTextField.text
        detailTaskModel.subtask = self.subtaskTextField.text
        detailTaskModel.date = self.dueDatePicker.date
        detailTaskModel.completed = self.detailTaskModel.completed
        
        appDelegate.saveContext()
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
}

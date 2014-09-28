//
//  ViewController.swift
//  TaskIt
//
//  Created by Marc Gugliuzza on 9/27/14.
//  Copyright (c) 2014 77th Street Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: date1, isCompleted: false)
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: date2, isCompleted: false)
        
        let incompleteTasks = [task1, task2, TaskModel(task: "Gym", subtask: "Leg Day", date: date3, isCompleted: false)]
        
        var completeTasks = [TaskModel(task: "Code", subtask: "Task project", date: date2, isCompleted: true)]
        
        self.baseArray = [incompleteTasks, completeTasks]
                
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // this is a way to force a reload of data in the table:
    
    override func viewDidAppear(animated: Bool) {
    
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // only sort the first array
        self.baseArray[0] = self.baseArray[0].sorted { (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow() // tells us which indexPath was currently selected in our tableView
            let thisTask = self.baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
        } else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
            
        }
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    // UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.baseArray[section].count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = self.baseArray[indexPath.section][indexPath.row]
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To do"
        } else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, isCompleted: true)
            self.baseArray[1].append(newTask)
        } else {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, isCompleted: false)
            self.baseArray[0].append(newTask)
        }
        
        
        self.baseArray[indexPath.section].removeAtIndex(indexPath.row)
        self.tableView.reloadData()
        
    }
    
    // helper functions
    
    // note: this is not ncessary because we are using a closure instead inside of viewWillAppear
    func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
        return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
    }
}


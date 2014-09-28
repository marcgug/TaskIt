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
    
    var taskArray:[Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1:Dictionary<String, String> = [
            "task": "Study French",
            "subtask": "Verbs",
            "date": "01/14/2014" ]
        
        let task2:Dictionary<String, String> = [
            "task": "Eat Dinner",
            "subtask": "Burgers",
            "date": "01/14/2014" ]
        
        let task3:Dictionary<String, String> = [
            "task": "Gym",
            "subtask": "Leg Day",
            "date": "01/14/2014" ]
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.taskArray.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let taskDict = self.taskArray[indexPath.row]
        
        cell.taskLabel.text = taskDict["task"]
        cell.descriptionLabel.text = taskDict["subtask"]
        cell.dateLabel.text = taskDict["date"]
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}


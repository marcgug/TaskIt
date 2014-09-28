//
//  TaskModel.swift
//  TaskIt
//
//  Created by Marc Gugliuzza on 9/28/14.
//  Copyright (c) 2014 77th Street Labs. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}



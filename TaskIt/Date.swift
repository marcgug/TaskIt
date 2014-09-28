//
//  Date.swift
//  TaskIt
//
//  Created by Marc Gugliuzza on 9/28/14.
//  Copyright (c) 2014 77th Street Labs. All rights reserved.
//

import Foundation

class Date {
    
    
    
    class func from(#year: Int, month: Int, day:Int ) -> NSDate {
        
        
        // COURSE IMPLEMENTATION
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        
        var date = gregorianCalendar.dateFromComponents(components)
        
        return date!
        
        
        // MY IMPLEMENTATION

        /*
        
        var calendar:NSCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var components:NSDateComponents = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        
        return calendar.dateFromComponents(components)!
        */
    }
    
    class func toString(#date: NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        
        return dateString
        
        
    }
    
}

//
//  EventStatistics.swift
//  StickToIt
//
//  Created by twer on 7/19/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import Foundation

class EventStatistics {
    
    var event:Event
    var startDate:NSDate?
    var times:uint = 551
    var checkedThisTime = false
    
    var duration:Int{
        get{
            let cal = NSCalendar.currentCalendar()
            let unit:NSCalendarUnit = NSCalendarUnit.CalendarUnitDay
            let components = cal.components(unit, fromDate: startDate!, toDate: NSDate(), options: nil)
            return components.day
        }
    }
    
    init(event:Event, startDate:NSDate){
        self.event = event
        self.startDate = startDate
    }
}
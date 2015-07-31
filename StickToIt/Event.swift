//
//  Event.swift
//  StickToIt
//
//  Created by twer on 7/19/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import Foundation
import AVOSCloud

class Event : AVObject, AVSubclassing {
    var name:String = ""
    var eventDescription:String?
    var startTime:NSDate?
    var endTime:NSDate?
    var needAlert:Bool = false
    
    var startDate:NSDate?
    var times:uint = 52
    var checkedThisTime = false
    
    var duration:Int{
        get{
            let cal = NSCalendar.currentCalendar()
            let unit:NSCalendarUnit = NSCalendarUnit.CalendarUnitDay
            let components = cal.components(unit, fromDate: startDate!, toDate: NSDate(), options: nil)
            return components.day
        }
    }
    
}
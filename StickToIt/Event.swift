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
    @NSManaged var name:String
    @NSManaged var eventDescription:String?
    @NSManaged var startTime:NSDate?
    @NSManaged var endTime:NSDate?
    @NSManaged var needAlert:Bool
    
    @NSManaged var startDate:NSDate?
    @NSManaged var times:uint
    @NSManaged var checkedThisTime:Bool
    
    override init(){
        super.init()
        
        self.needAlert = false
        self.times = 52
        self.checkedThisTime = false
    }
    
    var duration:Int{
        get{
            let cal = NSCalendar.currentCalendar()
            let unit:NSCalendarUnit = NSCalendarUnit.CalendarUnitDay
            let components = cal.components(unit, fromDate: startDate!, toDate: NSDate(), options: nil)
            return components.day
        }
    }
    
    static func parseClassName() -> String! {
        return "Event"
    }
}
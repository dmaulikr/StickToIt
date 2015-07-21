//
//  Event.swift
//  StickToIt
//
//  Created by twer on 7/19/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import Foundation

class Event {
    var name:String = ""
    var description:String?
    var startTime:NSDate?
    var endTime:NSDate?
    var needAlert:Bool = false
}
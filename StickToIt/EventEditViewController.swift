//
//  EventEditViewController.swift
//  StickToIt
//
//  Created by twer on 7/30/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventEditViewController: UIViewController {

    var eventStatistics:EventStatistics!
    
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDescription: UITextView!
    
    @IBOutlet weak var stickDays: UILabel!
    @IBOutlet weak var durationDays: UILabel!
    
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    
    @IBOutlet weak var needAlert: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initData()
    }

    func initData(){
        eventName.text = eventStatistics.event.name
        eventDescription.text = eventStatistics.event.description
        
        stickDays.text = String(eventStatistics.times)
        durationDays.text = String(eventStatistics.duration)
        
        startTime.date = eventStatistics.event.startTime!
        endTime.date = eventStatistics.event.endTime!
        
        needAlert.on = eventStatistics.event.needAlert
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let event = eventStatistics.event
        event.name = eventName.text
        event.description = eventDescription.text
        event.startTime = startTime.date
        event.endTime = endTime.date
        event.needAlert = needAlert.on
    }

}

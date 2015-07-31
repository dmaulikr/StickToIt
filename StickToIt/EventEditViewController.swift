//
//  EventEditViewController.swift
//  StickToIt
//
//  Created by twer on 7/30/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventEditViewController: UIViewController {

    var event:Event!
    
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
        eventName.text = event.name
        eventDescription.text = event.description
        
        stickDays.text = String(event.times)
        durationDays.text = String(event.duration)
        
        startTime.date = event.startTime!
        endTime.date = event.endTime!
        
        needAlert.on = event.needAlert
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is EventDetailViewController {
            event.name = eventName.text
            event.description = eventDescription.text
            event.startTime = startTime.date
            event.endTime = endTime.date
            event.needAlert = needAlert.on
        }else if segue.destinationViewController is EventTableViewController{
            let eventTableViewController = segue.destinationViewController as! EventTableViewController
            eventTableViewController.removeEvent(event)
        }
    }
}

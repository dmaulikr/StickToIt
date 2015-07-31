//
//  AddEventViewController.swift
//  StickToIt
//
//  Created by twer on 7/17/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController{

    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var eventDescription: UITextView!

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        eventDescription!.layer.borderWidth = 1
        eventDescription!.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addEvent" {
            let eventTableViewController = segue.destinationViewController as! EventTableViewController
            var event = Event()
            event.name = name.text
            event.eventDescription = eventDescription.text
            event.startTime = startDatePicker.date
            event.endTime = endDatePicker.date
            event.needAlert = alertSwitch.on
            event.startDate = NSDate()
            
            eventTableViewController.event = event
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        */

}

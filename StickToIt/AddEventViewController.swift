//
//  AddEventViewController.swift
//  StickToIt
//
//  Created by twer on 7/17/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var eventDescription: UITextView!

    @IBOutlet weak var cyclePicker: UIPickerView!

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    var cycleType = ["天", "周"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        eventDescription!.layer.borderWidth = 1
        eventDescription!.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        cyclePicker.dataSource = self
        cyclePicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cycleType.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return cycleType[row]
    }
    
    
    @IBAction func startDatePickerAction(sender: UIDatePicker) {

    }
    

    @IBAction func endDatePickerAction(sender: UIDatePicker) {
    }

    @IBAction func needAlertSwitchChangeAction(sender: UISwitch) {
        println(sender.on.description)
    }
    
    
    @IBAction func AddEvent(sender: UIBarButtonItem) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addEvent" {
            let eventTableViewController = segue.destinationViewController as! EventTableViewController
            var event = Event()
            event.name = name.text
            event.description = eventDescription.text
            event.startTime = startDatePicker.date
            event.endTime = endDatePicker.date
            event.needAlert = alertSwitch.on
            
            var eventStatistics = EventStatistics(event:event, startDate:NSDate())
            eventTableViewController.eventStatistics = eventStatistics
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        */

}

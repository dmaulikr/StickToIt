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

    
    var cycleType = ["Day", "Week"]
    
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.whiteColor();
        }
        else if(row == 1)
        {
            self.view.backgroundColor = UIColor.redColor();
        }
    }
    
    @IBAction func startDatePickerAction(sender: UIDatePicker) {

    }
    

    @IBAction func endDatePickerAction(sender: UIDatePicker) {
    }

    @IBAction func needAlertSwitchChangeAction(sender: UISwitch) {
        println(sender.on.description)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  EventDetailViewController.swift
//  StickToIt
//
//  Created by twer on 7/23/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var eventStatistics:EventStatistics?
    
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var stickDays: UILabel!
    @IBOutlet weak var durationDays: UILabel!
    @IBOutlet weak var cycleType: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var hasAlert: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showEventStatisticsDetail()
    }
    
    func showEventStatisticsDetail(){
        if eventStatistics != nil{
            title = eventStatistics!.event.name
            eventDescription.text = eventStatistics!.event.description
            stickDays.text = String(eventStatistics!.times)
            durationDays.text = String(eventStatistics!.duration)
            cycleType.text = "天"
            
            let dayTimeFomatter = NSDateFormatter()
            dayTimeFomatter.dateFormat = "h:m"
            startTime.text = dayTimeFomatter.stringFromDate(eventStatistics!.event.startTime!)
            endTime.text = dayTimeFomatter.stringFromDate(eventStatistics!.event.endTime!)
            hasAlert.on = eventStatistics!.event.needAlert
        }

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

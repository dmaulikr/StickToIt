//
//  EventDetailViewController.swift
//  StickToIt
//
//  Created by twer on 7/23/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var eventStatistics:EventStatistics?
    
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var stickDays: UILabel!
    @IBOutlet weak var durationDays: UILabel!
    @IBOutlet weak var cycleType: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var hasAlert: UISwitch!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showEventStatisticsDetail()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 90, height: 90)
        if let unwrappedCollectionView = collectionView{
            unwrappedCollectionView.dataSource = self
            unwrappedCollectionView.delegate = self
            unwrappedCollectionView.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func showEventStatisticsDetail(){
        if let unwrappedEventStatistics = eventStatistics {
            title = unwrappedEventStatistics.event.name
            eventDescription.text = unwrappedEventStatistics.event.description
            stickDays.text = String(unwrappedEventStatistics.times)
            durationDays.text = String(unwrappedEventStatistics.duration)
            cycleType.text = "天"
            
            let dayTimeFomatter = NSDateFormatter()
            dayTimeFomatter.dateFormat = "h:m"
            startTime.text = dayTimeFomatter.stringFromDate(unwrappedEventStatistics.event.startTime!)
            endTime.text = dayTimeFomatter.stringFromDate(unwrappedEventStatistics.event.endTime!)
            hasAlert.on = unwrappedEventStatistics.event.needAlert
        }

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! UICollectionViewCell
        let uiImage = cell.viewWithTag(100) as! UIImageView
        return cell
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

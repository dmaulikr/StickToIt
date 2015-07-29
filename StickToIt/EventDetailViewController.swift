//
//  EventDetailViewController.swift
//  StickToIt
//
//  Created by twer on 7/23/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var eventStatistics:EventStatistics!
    
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.whiteColor()
    }
    
    func showEventStatisticsDetail(){
        title = eventStatistics.event.name
        eventDescription.text = eventStatistics.event.description
        stickDays.text = String(eventStatistics.times)
        durationDays.text = String(eventStatistics.duration)
        cycleType.text = "天"
        
        let dayTimeFomatter = NSDateFormatter()
        dayTimeFomatter.dateFormat = "h:m"
        startTime.text = dayTimeFomatter.stringFromDate(eventStatistics.event.startTime!)
        endTime.text = dayTimeFomatter.stringFromDate(eventStatistics.event.endTime!)
        hasAlert.on = eventStatistics.event.needAlert
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalZhengCnt()
    }
    
    func totalZhengCnt() -> Int{
        return (Int(eventStatistics.times) + 4)/5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! UICollectionViewCell
        
        if (indexPath.item + 1 == totalZhengCnt()){
            var uiImage = cell.viewWithTag(100) as! UIImageView
            
            let lastIndex = eventStatistics.times % 5
            let imageName = String(lastIndex != 0 ? lastIndex : 5) + "_zheng.png"
            uiImage.image = UIImage(named:imageName)
        }
        
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

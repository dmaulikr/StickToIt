//
//  EventTableViewController.swift
//  StickToIt
//
//  Created by twer on 7/19/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    var eventStatisticsList = [EventStatistics]()
    var eventStatistics:EventStatistics?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func removeEventStatistics(eventStatistics:EventStatistics){
        var toBeRemovedIndex:Int?
        for index in 0...eventStatisticsList.count{
            if eventStatisticsList[index] === eventStatistics{
                toBeRemovedIndex = index
                break
            }
        }
        
        if let unwrappedToBeRemovedIndex = toBeRemovedIndex{
            eventStatisticsList.removeAtIndex(unwrappedToBeRemovedIndex)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return eventStatisticsList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as! EventStatisticsTableViewCell
        let cellData = eventStatisticsList[indexPath.row]
        
        cell.eventName.text = cellData.event.name
        cell.times.text = String(cellData.times)
        
        cell.alertImage.hidden = !cellData.event.needAlert
        cell.checkedImage.hidden = !cellData.checkedThisTime
        
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
       performSegueWithIdentifier("showDetail", sender: eventStatisticsList[indexPath.row])
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showDetail")
        {
            let item = sender as! EventStatistics
            
            let eventDetailViewController = segue.destinationViewController as! EventDetailViewController
            eventDetailViewController.eventStatistics = item
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cellData = eventStatisticsList[indexPath.row]
        cellData.times++
        cellData.checkedThisTime = true
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    @IBAction func unwindFromAddEvent(sender: UIStoryboardSegue){
        if let unwrappedEventStatistics = eventStatistics {
            eventStatisticsList.append(unwrappedEventStatistics)
        }
    }
    
    @IBAction func unwindFromDeleteEvent(sender: UIStoryboardSegue){
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    

}

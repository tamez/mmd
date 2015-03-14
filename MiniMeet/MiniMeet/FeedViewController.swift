//
//  FeedViewController.swift
//  MiniMeet
//
//  Created by Hi_Hu on 3/10/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedScrollView: UIScrollView!
    
    var events = [String]()
    var locations = [String]()
    var times = [String]()
    var images = [UIImage]()

    @IBOutlet weak var eventTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.rowHeight = 205
        events = ["Technofeminism", "Game of Thrones", "Biking in the Bay", "Product Design"]
        locations = ["Sightglass Coffee", "Blue Bottle Coffee", "Starbucks", "Red Dog"]
        times = ["March 20, 1 pm", "April 22, 2 pm", "April 4, 3 pm", "April 6, 3 pm"]
       


        // Do any additional setup after loading the view.
        feedScrollView.contentSize.height = 1000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Events"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return events.count
        }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier("eventCellId") as EventCell
            
            cell.eventTitle.text = events[indexPath.row]
            cell.eventLocation.text = locations[indexPath.row]
            cell.eventTime.text = times[indexPath.row]
        
            var imageName = UIImage(named: events[indexPath.row])
            cell.eventImage.image = imageName
            
            return cell
        }
   /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("testSegue", sender: self)
    }
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

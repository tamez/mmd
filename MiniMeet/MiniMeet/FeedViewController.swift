//
//  FeedViewController.swift
//  MiniMeet
//
//  Created by Hi_Hu on 3/10/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var events = [String]()
    var subtitle = [String]()
    
    @IBOutlet weak var eventTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.rowHeight = 185
        events = ["Technofeminism", "Game of Thrones", "Biking in the Bay"]
        subtitle = ["Sightglass Coffee • March 20, 1 pm", "Blue Bottle Coffee • April 22, 2 pm", "Starbucks • April 4, 3 pm"]       


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return events.count
        }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier("eventCellId") as EventCell
            
            cell.eventTitle.text = events[indexPath.row]
            cell.eventSubtitle.text = subtitle[indexPath.row]
        
            var imageName = UIImage(named: events[indexPath.row])
            cell.eventImage.image = imageName
            
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

//
//  FeedViewController.swift
//  MiniMeet
//
//  Created by Hi_Hu on 3/10/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isPresenting: Bool = true

    var events = [String]()
    var subtitle = [String]()
    
    @IBOutlet weak var eventTableView: UITableView!
    
    var selectedImageView: UIImageView!
    var movingImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var endTransition: CGRect!
    var imageTransition: ImageTransition!
    
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
        return 3
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
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as DetailsViewController
        destinationVC.image = selectedImageView.image
        var height = (selectedImageView.image!.size.height*320)/selectedImageView.image!.size.width
        endTransition = CGRect(x: 0, y: ((self.view.frame.size.height - height)/2), width: 320, height: height)
        
        
        imageTransition = ImageTransition()
        imageTransition.duration = 0.5
        imageTransition.endTransition = endTransition
        
        
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = imageTransition
        
        destinationVC.endTransition = imageTransition.endTransition
    }

    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        var imageView = sender.view as UIImageView
        selectedImageView = imageView
        performSegueWithIdentifier("detailsSegue", sender: self)
    }
    
    
    

}

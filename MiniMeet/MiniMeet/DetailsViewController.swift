//
//  DetailsViewController.swift
//  MiniMeet
//
//  Created by Michelle Venetucci Harvey on 3/14/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }

    @IBOutlet weak var attendeeOne: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mapView: UIImageView!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventSubtitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var dividerBar: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var submitView: UIView!
    
    var event: Event?

    // the final position upon end drag
    var endFrame: CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = contentView.frame.size
        scrollView.delegate = self

        imageView.image = event?.image
        imageView.hidden = true
        
        descriptionText.alpha = 0
        descriptionTitle.alpha = 0
        submitButton.alpha = 0
        dividerBar.alpha = 0
        mapView.alpha = 0
        attendeeOne.alpha = 0
        
        eventTitle.text = event?.title
        eventSubtitle.text = event?.subtitle
        
        self.view.backgroundColor = UIColor(red: 56/255, green: 77/255, blue: 103/255, alpha: 0.9)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        imageView.hidden = false
        animateDetailsDown()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        var newImagePoint = imageView.frame.origin
        var offsetFade = 1 - (scrollView.contentOffset.y / -60)
        
        submitButton.alpha = offsetFade
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
            var offsetY = scrollView.contentOffset.y
            
            if scrollView.contentOffset.y < -60 {
                dismissViewControllerAnimated(true, completion: nil)
                imageView.alpha = 0
                scrollView.alpha = 0
                
                // set endFrame properties
                endFrame = imageView.frame
                
                // shift the position by offset
                endFrame.origin.y = -offsetY
            }
    }


    @IBAction func submitButtonDidPress(sender: AnyObject) {
        
        
        
//        delay(2, { () -> () in
//        // alertView.dismissWithClickedButtonIndex(0, animated: true)
//       self.performSegueWithIdentifier("attendEventSegue", sender: self)
//        })
    }


    // animate event details description and map on page load

    func animateDetailsDown () {
        var descriptionPosition = self.descriptionText.center.y
        var descriptionTitlePosition = self.descriptionTitle.center.y
        var submitPosition = self.submitButton.center.y
        var dividerPosition = self.dividerBar.center.y
        var mapPosition = self.mapView.center.y
        let duration: NSTimeInterval = 0.8
        
        var titlePosition = self.eventTitle.center.y
        var subtitlePosition = self.eventSubtitle.center.y
        
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 40, options: nil, animations: { () -> Void in
            self.descriptionText.center.y = descriptionPosition + 30
            self.descriptionText.alpha = 1
            self.descriptionTitle.center.y = descriptionTitlePosition + 30
            self.descriptionTitle.alpha = 1
            self.attendeeOne.alpha = 1
           // self.eventTitle.center.y = titlePosition + 10
           // self.eventSubtitle.center.y = subtitlePosition + 10
            
            
        }) { (bool) -> Void in
            //
        }
        
        UIView.animateWithDuration(duration, delay: 0.15, usingSpringWithDamping: 0.5, initialSpringVelocity: 40, options: nil, animations: { () -> Void in
            self.submitButton.center.y = submitPosition + 30
            self.submitButton.alpha = 1
            }) { (bool) -> Void in
                //
        }
        
        UIView.animateWithDuration(duration, delay: 0.23, usingSpringWithDamping: 0.5, initialSpringVelocity: 40, options: nil, animations: { () -> Void in
            self.dividerBar.center.y = dividerPosition + 30
            self.dividerBar.alpha = 1
            }) { (bool) -> Void in
                //
        }
        
        UIView.animateWithDuration(duration, delay: 0.35, usingSpringWithDamping: 0.5, initialSpringVelocity: 40, options: nil, animations: { () -> Void in
            self.mapView.center.y = mapPosition + 30
            self.mapView.alpha = 1
        }) { (bool) -> Void in
            //
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            var submitViewStart = submitView.center.y + 700
            var submitViewEnd = submitView.center.y
            submitView.center.y = submitViewStart
            
            
            
            UIView.animateWithDuration(0.5)
                { () -> Void in
                    self.submitView.center.y = submitViewEnd
                    
            }
            
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()              }
        }
    }

    
    
    
    
    
    
   
}

//
//  FeedViewController.swift
//  HW5 - Facebook
//
//  Created by Stephen Davis on 6/13/16.
//  Copyright © 2016 Stephen Davis. All rights reserved.
//

import UIKit

var likeButtonTapped: UIButton!

class FeedViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var likeButtonDisplay: UIImageView!
    
    var fadeTransition: FadeTransition!

    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.

        var photoViewController = segue.destinationViewController as! PhotoViewController
        
        // Access the image to display

        photoViewController.image = self.imageView.image
        
        
        // Set the modal presentation style of your destinationViewController to be custom.
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        photoViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
        
        
    }
    
    
    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        
        imageView = sender.view as! UIImageView

        performSegueWithIdentifier("Image Expanded", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize (width: 320, height: 1000)
        likeButtonDisplay.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)


    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            

        
        UIView.animateWithDuration(
            0.3,delay: 2, options: .CurveEaseInOut, animations: {
                self.likeButtonDisplay.alpha = 1
            },
            completion: nil)
        
        
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

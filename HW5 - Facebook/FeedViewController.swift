//
//  FeedViewController.swift
//  HW5 - Facebook
//
//  Created by Stephen Davis on 6/13/16.
//  Copyright © 2016 Stephen Davis. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.image = self.imageView.image
        
    }
    
    
    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("Image Expanded", sender: self)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize (width: 320, height: 1000)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

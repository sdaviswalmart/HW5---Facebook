//
//  PhotoViewController.swift
//  HW5 - Facebook
//
//  Created by Stephen Davis on 6/13/16.
//  Copyright © 2016 Stephen Davis. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var expandedImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionButtons: UIImageView!
    @IBOutlet weak var likeField: UILabel!
    
    var image: UIImage!
    var initialCenter: CGPoint!
    var actionButtonCenter:CGPoint!

    

    
    @IBAction func dismissButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func likeButtonTapped(sender: UIButton) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.actionButtons.transform = CGAffineTransformMakeTranslation(10,0)
        })
        
        UIView.animateWithDuration (0.5,delay: 0, options: .CurveEaseInOut, animations: {
            self.likeField.alpha = 1
            },
            completion: nil)

    }

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize (width: 320, height: 1000)
        expandedImage.image = image
        
        // Set initial properties as a basis to have them changed

        scrollView.delegate = self
        initialCenter = expandedImage.center
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        doneButton.alpha = 1
        
        self.likeField.alpha = 0

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) { 
        // This method is called as the user scrolls
        UIScrollView.animateWithDuration(0.4) {
            self.doneButton.alpha = 0
            self.scrollView.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
            
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            
            let offset = CGFloat(scrollView.contentOffset.y)
            
            if offset < -120 {
                dismissViewControllerAnimated(true, completion: nil)
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        
        UIScrollView.animateWithDuration(0.1) {
            self.doneButton.alpha = 1
            self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
            
            
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return expandedImage
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

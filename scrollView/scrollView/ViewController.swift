//
//  ViewController.swift
//  scrollView
//
//  Created by Lei Zhao on 12/20/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: CGRect(x: 37, y: 98, width: 300, height: 200))
        scrollView.backgroundColor = UIColor.orange
        self.view.addSubview(scrollView)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "1"))
        scrollView.addSubview(imageView)

        scrollView.contentSize = CGSize(width: imageView.frame.width, height: imageView.frame.height)
        scrollView.contentOffset = CGPoint(x: -50, y: 50)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        NSLog("scroll view did scroll")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        NSLog("scroll view will begin dragging")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        NSLog("scroll view will end dragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if !decelerate {
            NSLog("User stop scroll and scroll view stop scroll")
        } else {
            NSLog("User stop scroll, but scroll view is still scrolling")
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        NSLog("scroll view did end decelerating")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


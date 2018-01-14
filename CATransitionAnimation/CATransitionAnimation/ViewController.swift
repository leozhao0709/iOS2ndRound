//
//  ViewController.swift
//  CATransitionAnimation
//
//  Created by Lei Zhao on 1/13/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

let maxImageIndex = 9
let minImageIndex = 1

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var currentIndex = 0
    lazy var imageArr: [UIImage] = {
        var images:[UIImage] = []
        for i in minImageIndex...maxImageIndex {
            let image = UIImage(named: "\(i)")
            images.append(image!)
        }
        return images
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self.imageView)
        
        if position!.x > self.view.bounds.width*0.5 {
            self.nextImage()
        } else {
            self.previousImage()
        }
    }
    
    private func nextImage() {
        self.currentIndex += 1
        
        if self.currentIndex >= self.imageArr.count {
            self.currentIndex = 0
        }
        
        self.imageView.image = self.imageArr[self.currentIndex]
        
//        let animation = CATransition()
//        animation.duration = 1
//        animation.type = "pageCurl"
//        animation.subtype = "fromTop"
//
//        animation.startProgress = 0.5
//        animation.endProgress = 1
//
//        self.imageView.layer.add(animation, forKey: nil)
        
        self.animate()
    }
    
    private func previousImage() {
        self.currentIndex -= 1
        
        if self.currentIndex < 0 {
            self.currentIndex = self.imageArr.count-1
        }
        
        self.imageView.image = self.imageArr[self.currentIndex]
        
//        let animation = CATransition()
//        animation.duration = 1
//        animation.type = "pageCurl"
//        animation.subtype = "fromTop"
//
//        animation.startProgress = 0.5
//        animation.endProgress = 1
//
//        self.imageView.layer.add(animation, forKey: nil)
        
        self.animate()
    }
    
    private func animate() {
        let animation = CATransition()
        animation.duration = 1
        animation.type = "cameraIrisHollowClose"
//        animation.subtype = "fromTop"
        
        animation.startProgress = 0.5
        animation.endProgress = 1
        
        self.imageView.layer.add(animation, forKey: nil)
    }

}


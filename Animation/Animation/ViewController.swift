//
//  ViewController.swift
//  Animation
//
//  Created by Lei Zhao on 1/13/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var redView: UIView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.setViewAnimation()
//        self.setCAAnimation()
        self.setKeyFrameAnimation()
    }
    
    private func setKeyFrameAnimation() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        let value1 = CGRect(x: 0, y: 0, width: 100, height: 100)
        let value2 = CGRect(x: 200, y: 0, width: 100, height: 100)
        let value3 = CGRect(x: 200, y: 300, width: 100, height: 100)
        let value4 = CGRect(x: 0, y: 300, width: 100, height: 100)
        animation.values = [value1, value2, value3, value4, value1]
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 3
        
//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 200, height: 300))
        animation.path = path.cgPath
        
        self.animatedView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        self.animatedView.layer.add(animation, forKey: nil)
    }
    
    private func setViewAnimation() {
        printLog(message: "redView before Animation: \(self.redView.frame)")
        
        UIView.animate(withDuration: 0.5, animations: {
            var frame = self.redView.frame
            frame.origin.y += 150
            self.redView.frame = frame
        }) { (finished) in
            printLog(message: "redView before Animation: \(self.redView.frame)")
        }
    }
    
    private func setCAAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.toValue = self.animatedView.center.y + 150
        animation.duration = 0.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        
        self.animatedView.layer.add(animation, forKey: "animationName")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        printLog(message: "animatedView before Animation: \(self.animatedView.frame)")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        self.animatedView.layer.removeAnimation(forKey: "animationName")
        printLog(message: "animatedView after Animation: \(self.animatedView.frame)")
    }
}


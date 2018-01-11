//
//  ViewController.swift
//  图片截屏
//
//  Created by Lei Zhao on 1/9/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var startPanPoint: CGPoint = CGPoint.zero
    
    weak var _coverView: UIView?
    weak var coverView: UIView? {
        set {
            self._coverView = newValue
        }
        get {
            if self._coverView == nil {
                let view = UIView()
                view.backgroundColor = UIColor.black
                view.alpha = 0.7
                self.view.addSubview(view)
                self._coverView = view
            }
            return self._coverView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.imageView.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        if panGesture.state == .began {
            self.startPanPoint = panGesture.location(in: self.imageView)
        } else if panGesture.state == .changed {
            let curPoint = panGesture.location(in: self.imageView)
            
            let x: CGFloat = self.startPanPoint.x < curPoint.x ? self.startPanPoint.x:curPoint.x
            let y: CGFloat = self.startPanPoint.y < curPoint.y ? self.startPanPoint.y:curPoint.y
            let width: CGFloat = fabs(curPoint.x - self.startPanPoint.x)
            let height: CGFloat = fabs(curPoint.y - self.startPanPoint.y)
            
            self.coverView?.frame = CGRect(x: x, y: y, width: width, height: height)
        } else if panGesture.state == .ended {
            
            UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0)
            
            let clipPath = UIBezierPath(rect: (self.coverView?.frame)!)
            clipPath.addClip()
            
            self.imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.imageView.image = image
            
            self.coverView?.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


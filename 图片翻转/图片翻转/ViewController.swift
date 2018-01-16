//
//  ViewController.swift
//  图片翻转
//
//  Created by Lei Zhao on 1/16/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var bottomImage: UIImageView!
    
    weak var gradienLayer: CAGradientLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topImage.layer.contentsRect = CGRect(x: 0, y: 0, width: 1, height: 0.5)
        self.bottomImage.layer.contentsRect = CGRect(x: 0, y: 0.5, width: 1, height: 0.5)
        
        self.topImage.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.bottomImage.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        self.addPanGesture()
        
        self.addGradientLayer()
    }
    
    private func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.gray.cgColor]
        gradientLayer.frame = self.bottomImage.bounds
        
        gradientLayer.opacity = 0
        self.bottomImage.layer.addSublayer(gradientLayer)
        self.gradienLayer = gradientLayer
    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))

        self.backgroundView.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let curPoint = panGesture.translation(in: panGesture.view)
        
        let rotateAngle = curPoint.y / panGesture.view!.bounds.height * CGFloat.pi
        
        var transform = CATransform3DIdentity
        transform.m34 = -1/300
        
        self.topImage.layer.transform = CATransform3DRotate(transform, -rotateAngle, 1, 0, 0)
        
        self.gradienLayer?.opacity = Float(curPoint.y/panGesture.view!.bounds.height)
        if panGesture.state == .ended {
            self.gradienLayer?.opacity = 0
            
            //usingSpringWithDamping越小, 弹性系数越大
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.topImage.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
    }

}


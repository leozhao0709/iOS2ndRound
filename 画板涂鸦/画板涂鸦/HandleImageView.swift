//
//  HandleImageView.swift
//  画板涂鸦
//
//  Created by Lei Zhao on 1/11/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

protocol HandleImageViewDelegate: NSObjectProtocol {
    func handleImageView(handleImageView: HandleImageView, image: UIImage)
}

class HandleImageView: UIView, UIGestureRecognizerDelegate {
    
    weak var delegate: HandleImageViewDelegate?
    weak var _imageView: UIImageView?
    weak var imageView: UIImageView? {
        if _imageView == nil {
            let imageView = UIImageView()
            imageView.frame = self.bounds
            imageView.isUserInteractionEnabled = true
            self.addSubview(imageView)
            
            self._imageView = imageView
            self.addGesture()
        }
        return self._imageView
    }
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = self.image
        }
    }
    
    private func addGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.imageView?.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(pinchGesture:)))
        pinchGesture.delegate = self
        self.imageView?.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotate(rotateGesture:)))
        rotateGesture.delegate = self
        self.imageView?.addGestureRecognizer(rotateGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(longPressGesture:)))
        self.imageView?.addGestureRecognizer(longPressGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let transPosition = panGesture.translation(in: panGesture.view)
        imageView?.transform = (imageView?.transform.translatedBy(x: transPosition.x, y: transPosition.y))!
        
        panGesture.setTranslation(CGPoint.zero, in: panGesture.view)
    }
    
    @objc
    private func pinch(pinchGesture: UIPinchGestureRecognizer) {
        pinchGesture.view?.transform = (pinchGesture.view?.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale))!
        pinchGesture.scale = 1
    }
    
    @objc
    private func rotate(rotateGesture: UIRotationGestureRecognizer) {
        rotateGesture.view?.transform = (rotateGesture.view?.transform.rotated(by: rotateGesture.rotation))!
        rotateGesture.rotation = 0
    }
    
    @objc
    private func longPress(longPressGesture: UILongPressGestureRecognizer) {
        if longPressGesture.state == .began {
            UIView.animate(withDuration: 0.5, animations: {
                self.imageView?.alpha = 0
            }, completion: { (finished) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageView?.alpha = 1
                    
                    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
                    let ctx = UIGraphicsGetCurrentContext()
                    self.layer.render(in: ctx!)
                    let image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    
                    if let delegate = self.delegate {
                        delegate.handleImageView(handleImageView: self, image: image!)
                    }
                    
                    self.removeFromSuperview()
                })
            })
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

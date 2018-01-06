//
//  ViewController.swift
//  Gesture
//
//  Created by Lei Zhao on 1/5/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addPinchGesture()
        self.addRotateGesture()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    private func addRotateGesture() {
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotate(rotationGesture:)))
        rotateGesture.delegate = self
        self.testView.addGestureRecognizer(rotateGesture)
    }
    
    @objc
    private func rotate(rotationGesture: UIRotationGestureRecognizer) {
        let rotateDegree = rotationGesture.rotation
        self.testView.transform = self.testView.transform.rotated(by: rotateDegree)
        
        rotationGesture.rotation = 0
    }
    
    private func addPinchGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(pinchGesture:)))
        pinchGesture.delegate = self
        self.testView.addGestureRecognizer(pinchGesture)
    }
    
    @objc
    private func pinch(pinchGesture: UIPinchGestureRecognizer) {
        let scale = pinchGesture.scale
        self.testView.transform = self.testView.transform.scaledBy(x: scale, y: scale)
        pinchGesture.scale = 1
    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.testView.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let movedPoint = panGesture.translation(in: self.testView)
        self.testView.transform = self.testView.transform.translatedBy(x: movedPoint.x, y: movedPoint.y)
        panGesture.setTranslation(CGPoint.zero, in: self.testView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


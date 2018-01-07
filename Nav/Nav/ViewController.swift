//
//  ViewController.swift
//  Nav
//
//  Created by Lei Zhao on 1/6/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

let SCREEN_W = UIScreen.main.bounds.width
let SCREEN_H = UIScreen.main.bounds.height
let minimumSwipeSpace: CGFloat = 30
let navWidth: CGFloat = 200
class ViewController: UIViewController {

    weak var mainView: UIView!
    weak var navView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        let navView = UIView(frame: UIScreen.main.bounds)
        navView.backgroundColor = UIColor.black
        self.view.addSubview(navView)
        self.navView = navView
        
        
        let mainView = UIView(frame: UIScreen.main.bounds)
        mainView.backgroundColor = UIColor.orange
        self.view.addSubview(mainView)
        self.mainView = mainView
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.mainViewSwipe(panGesture:)))
        self.mainView.addGestureRecognizer(panGesture)
        
    }
    
    @objc
    private func mainViewSwipe(panGesture: UIPanGestureRecognizer) {
        let translationPoint = panGesture.translation(in: self.mainView)
        let velocity = panGesture.velocity(in: self.mainView)
        
        // right slide
        if velocity.x > 0 {
            if panGesture.state == .ended {
                // only come to right when frame x > minimumSwipeSpace
                if self.mainView.frame.origin.x > minimumSwipeSpace {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.mainView.transform = CGAffineTransform(translationX: navWidth, y: 0)
                    })
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.mainView.transform = CGAffineTransform(translationX: 0, y: 0)
                    })
                }
            } else {
                if self.mainView.frame.origin.x < navWidth {
                    self.mainView.transform = self.mainView.transform.translatedBy(x: translationPoint.x, y: 0)
                }
            }
        }
        
        // left slide
        if velocity.x < 0 {
            if panGesture.state == .ended {
                if self.mainView.frame.origin.x < minimumSwipeSpace {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.mainView.transform = CGAffineTransform(translationX: 0, y: 0)
                    })
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.mainView.transform = CGAffineTransform(translationX: navWidth, y: 0)
                    })
                }
            } else {
                if self.mainView.frame.origin.x > 0 {
                    if panGesture.state == .changed {
                        self.mainView.transform = self.mainView.transform.translatedBy(x: translationPoint.x, y: 0)
                    }
                }
            }
            
        }
        
        panGesture.setTranslation(CGPoint.zero, in: self.mainView)
    }

}


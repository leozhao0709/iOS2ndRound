//
//  WheelButton.swift
//  转盘
//
//  Created by Lei Zhao on 1/15/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class WheelButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var isHighlighted: Bool {
        set {
            
        }
        get {
            return false
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let width: CGFloat = 40
        let height: CGFloat = 48
        let y: CGFloat = 20
        let x = (contentRect.width - width) * 0.5
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height * 0.5)
        
        if rect.contains(point) {
            return super.hitTest(point, with: event)
        } else {
            return nil
        }
    }

}

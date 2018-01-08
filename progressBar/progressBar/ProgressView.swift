//
//  ProgressView.swift
//  progressBar
//
//  Created by Lei Zhao on 1/7/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    var percentage: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let arcCenter = CGPoint(x: self.bounds.width * 0.5, y: self.bounds.height * 0.5)
        let radius = self.bounds.width * 0.5 - 10
        let startAngle = -CGFloat.pi * 0.5
        let endAngle = startAngle + CGFloat.pi * 2 * self.percentage
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.stroke()
    }

}

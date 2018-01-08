//
//  DrawView.swift
//  pieChart
//
//  Created by Lei Zhao on 1/7/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var dataArray: [CGFloat]? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let sum = dataArray?.reduce(0, { (result: CGFloat, item: CGFloat) -> CGFloat in
            return result + item
        })
        
        let center = CGPoint(x: self.bounds.width * 0.5, y: self.bounds.height * 0.5)
        let radius = self.bounds.width * 0.5 - 10
        
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        for item in dataArray! {
            endAngle = startAngle + CGFloat.pi * 2 * (item/sum!)
            self.drawArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, color: self.getRandomColor())
            startAngle = endAngle
        }
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.setNeedsDisplay()
////        super.touchesBegan(touches, with: event)
//    }
    
    private func getRandomColor() -> UIColor {
//        let red: CGFloat = CGFloat(arc4random_uniform(256))/255.0
//        let green: CGFloat = CGFloat(arc4random_uniform(256))/255.0
//        let blue: CGFloat = CGFloat(arc4random_uniform(256))/255.0
        
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func drawArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: center)
        path.close()
        color.set()
        path.fill()
    }

}

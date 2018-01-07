//
//  DrawView.swift
//  Quartz2D
//
//  Created by Lei Zhao on 1/6/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class DrawView: UIView {

    override func draw(_ rect: CGRect) {
//        self.baseDraw()
//        self.drawRect()
//        self.drawRoundRect()
        self.drawArc()
    }
    
    private func drawArc() {
        let center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        let radius = self.bounds.width/2 - 10
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: -CGFloat.pi/2, clockwise: false)
        path.addLine(to: center)
        path.close()
        path.fill()
    }
    
    private func drawRoundRect() {
        let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 100, height: 100) , cornerRadius: 25)
        path.fill()
    }
    
    private func drawRect() {
        let path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 100, height: 100))
        
        path.move(to: CGPoint(x: 50, y: 250))
        path.addLine(to: CGPoint(x: 250, y: 250))
        
        path.lineWidth = 10
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        UIColor.orange.set()
        path.stroke()
    }
    
    private func baseDraw() {
        let ctx = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 250, y: 150))
        path.close()
        
        UIColor.red.set()
        
        ctx?.setLineCap(CGLineCap.round)
        ctx?.setLineJoin(CGLineJoin.round)
        ctx?.setLineWidth(10)
        
        ctx!.addPath(path.cgPath)
        ctx!.strokePath()
    }

}

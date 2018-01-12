//
//  DrawView.swift
//  画板涂鸦
//
//  Created by Lei Zhao on 1/11/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

protocol DrawViewDelegate: NSObjectProtocol {
    func DrawView(drawView: DrawView, pathArray: [Any]?)
}

class DrawView: UIView {
    
    var drawColor: UIColor = UIColor.black
    var drawWidth: CGFloat = 1
    
    var image: UIImage? {
        didSet {
            self.pathArray?.append(self.image!)
            self.setNeedsDisplay()
        }
    }
    
    weak var delegate: DrawViewDelegate?
    
    lazy var pathArray: [Any]? = {
        return []
    }()
    
    override func awakeFromNib() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let curPoint = panGesture.location(in: self)
        
        if panGesture.state == .began {
            let curPath = DrawPath()
            curPath.drawColor = self.drawColor
            curPath.drawWidth = self.drawWidth
            curPath.move(to: curPoint)
            self.pathArray?.append(curPath)
            
            if let delegate = self.delegate {
                delegate.DrawView(drawView: self, pathArray: pathArray)
            }
        } else if panGesture.state == .changed {
            let curPath = self.pathArray?.last as! DrawPath
            curPath.addLine(to: curPoint)
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for path in self.pathArray! {
            
            if let drawPath = path as? DrawPath {
                drawPath.drawColor?.set()
                drawPath.lineWidth = drawPath.drawWidth
                drawPath.lineCapStyle = .round
                drawPath.lineCapStyle = .round
                drawPath.stroke()
            } else {
                let image = path as? UIImage
                image?.draw(in: rect)
            }
        }
    }
    
    func clear() {
        self.pathArray?.removeAll()
        self.setNeedsDisplay()
        if let delegate = self.delegate {
            delegate.DrawView(drawView: self, pathArray: pathArray)
        }
    }
    
    func undo() {
        if self.pathArray!.count > 0 {
            self.pathArray?.removeLast()
            self.setNeedsDisplay()
        } else {
            if let delegate = self.delegate {
                delegate.DrawView(drawView: self, pathArray: pathArray)
            }
        }
    }
    
    func erase() {
        self.drawColor = UIColor.white
    }
}

//
//  DrawView.swift
//  手势解锁
//
//  Created by Lei Zhao on 1/10/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

let columns: CGFloat = 3
let rows: CGFloat = 3

class DrawView: UIView {
    
    var selectedBtn: [UIButton] = []
    var curPoint: CGPoint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    /**
     Just add UI, No frame need here
     */
    func setupUI() {
        let numberOfBtn: Int = Int(rows * columns)
        
        for _ in 0..<numberOfBtn {
            let btn = UIButton(normalImage: #imageLiteral(resourceName: "gesture_node_normal"), highlightImage: #imageLiteral(resourceName: "gesture_node_selected"), selectedImage: #imageLiteral(resourceName: "gesture_node_selected"))
            self.addSubview(btn)
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let curPoint = panGesture.location(in: self)
        self.curPoint = curPoint
        if panGesture.state == .began {
            if let btn = self.pointInBtn(point: curPoint) {
                if !btn.isSelected {
                    btn.isSelected = true
                    self.selectedBtn.append(btn)
                }
            }
        } else if panGesture.state == .changed {
            if let btn = self.pointInBtn(point: curPoint) {
                if !btn.isSelected {
                    btn.isSelected = true
                    self.selectedBtn.append(btn)
                }
            }
            self.setNeedsDisplay()
        } else if panGesture.state == .ended {
            for btn in self.selectedBtn {
                btn.isSelected = false
                self.selectedBtn.removeAll()
                self.setNeedsDisplay()
            }
        }
    }
    
    private func pointInBtn(point: CGPoint) -> UIButton? {
        for i in 0..<self.subviews.count {
            let btn = self.subviews[i] as! UIButton
            if btn.frame.contains(point) {
                return btn
            }
        }
        return nil
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnW: CGFloat = 74
        let btnH: CGFloat = 74
        let marginW: CGFloat = (self.bounds.width - columns * btnW)/(columns + 1)
        let marginH: CGFloat = (self.bounds.height - rows * btnH)/(rows + 1)
        for i in 0..<self.subviews.count {
            let btn = self.subviews[i] as! UIButton
            
            let row = i/Int(rows)
            let column = i%Int(columns)
            let x = CGFloat(column) * btnW + CGFloat(column+1) * marginW
            let y = CGFloat(row) * btnH + CGFloat(row + 1) * marginH
            
            btn.frame = CGRect(x: x, y: y, width: btnW, height: btnH)
        }
    }
    

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if self.selectedBtn.count != 0 {
            let path = UIBezierPath()
            path.move(to: (self.selectedBtn.first?.center)!)
            
            for i in 1..<self.selectedBtn.count {
                path.addLine(to: self.selectedBtn[i].center)
            }
            
            path.addLine(to: self.curPoint!)

            UIColor.red.set()
            path.lineWidth = 10
            path.lineJoinStyle = .round
            path.lineCapStyle = .round
            path.stroke()
        }
    }

}

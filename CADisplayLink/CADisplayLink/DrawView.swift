//
//  DrawView.swift
//  CADisplayLink
//
//  Created by Lei Zhao on 1/8/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var imageY: CGFloat = 0
    
    lazy var displayLink: CADisplayLink? = {
        print("displayLink-----")
        return CADisplayLink(target: self, selector: #selector(self.changeY))
    }()
    

    override func awakeFromNib() {
        self.displayLink?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
    }
    
    deinit {
        self.displayLink?.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
    }
    
    @objc private func changeY() {
        self.imageY += 10
        if self.imageY > UIScreen.main.bounds.height {
            self.imageY = 0
        }
        self.setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        let image = #imageLiteral(resourceName: "sandyBalloon")
        image.draw(at: CGPoint(x: 0, y: self.imageY))
    }

}

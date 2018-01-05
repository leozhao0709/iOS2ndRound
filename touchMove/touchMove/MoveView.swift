//
//  MoveView.swift
//  touchMove
//
//  Created by Lei Zhao on 1/4/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class MoveView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        let preLocation = touch?.previousLocation(in: self)
        let currLocation = touch?.location(in: self)
        
        self.transform = self.transform.translatedBy(x: currLocation!.x - preLocation!.x, y: currLocation!.y - preLocation!.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }

}

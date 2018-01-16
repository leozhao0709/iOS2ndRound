//
//  MyButton.swift
//  响应者链条
//
//  Created by Lei Zhao on 1/15/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class MyButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("button \(#function)")
        super.touchesBegan(touches, with: event)
    }

}

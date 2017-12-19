//
//  testView.swift
//  拳皇
//
//  Created by Lei Zhao on 12/18/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class testView: UIView {
    
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
        // initial UI, but do not set frame as in this step, you can't get frame
    }
    
    /**
     init different UI frame here
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        // setup each UI frame here
    }


}

//
//  CustomButton.swift
//  自定义UIButton
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.textAlignment = .center

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: 100, height: 70)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 100, y: 0, width: 70, height: 70)
    }
    */
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 100, y: 0, width: 70, height: 70)
        self.titleLabel?.frame = CGRect(x: 0, y: 0, width: 100, height: 70)
    }
    
}

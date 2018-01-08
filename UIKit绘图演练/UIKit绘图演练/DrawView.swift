//
//  DrawView.swift
//  UIKit绘图演练
//
//  Created by Lei Zhao on 1/7/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class DrawView: UIView {

    override func draw(_ rect: CGRect) {
        let image = UIImage(named: "阿狸头像")
//        image?.draw(at: CGPoint.zero)
//        image?.draw(in: rect)
        
        UIRectClip(CGRect(x: 0, y: 0, width: 50, height: 50))
        image?.drawAsPattern(in: rect)
    }
    
    private func drawText() {
        let str: NSString = "Lzhao"
        let attributes: [NSAttributedStringKey : Any]? = [:]
        str.draw(at: CGPoint.zero, withAttributes: attributes)
//        str.draw(in: rect, withAttributes: attributes)
    }

}

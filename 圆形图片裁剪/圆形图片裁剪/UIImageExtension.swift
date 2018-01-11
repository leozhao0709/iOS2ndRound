//
//  UIImageExtension.swift
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// strech an image from middle
    ///
    /// - Parameter image: the original image
    /// - Returns: the streched image
    func strechImage(image: UIImage?) -> UIImage? {
        var resizeImage = image
        
        if let image = image {
            resizeImage = image.stretchableImage(withLeftCapWidth: Int(image.size.width*0.5), topCapHeight: Int(image.size.height*0.5))
        }
        
        return resizeImage
    }
    
    
    /// clip an image to circleImage
    ///
    /// - Parameters:
    ///   - borderWidth: the border width we want to set
    ///   - borderColor: the border color we want to set
    /// - Returns: the new circle image
    func circleImage(withBorderWidth borderWidth: CGFloat = 0, andBorderColor borderColor: UIColor = UIColor.clear) -> UIImage? {
        let ctxSize = CGSize(width: self.size.width + 2 * borderWidth, height: self.size.height + 2 * borderWidth)
        UIGraphicsBeginImageContextWithOptions(ctxSize, false, 0)
        
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: ctxSize.width, height: ctxSize.height))
        borderColor.set()
        path.fill()
        
        let clipPath = UIBezierPath(ovalIn: CGRect(x: borderWidth, y: borderWidth, width: self.size.width, height: self.size.height))
        clipPath.addClip()
        self.draw(at: CGPoint(x: borderWidth, y: borderWidth))

        let circleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return circleImage
    }
    
}

//
//  UIImageExtension.swift
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// strech an image from its middle part
    ///
    /// - Returns: the streched image
    func strechedImage() -> UIImage? {
        let resizeImage = self.stretchableImage(withLeftCapWidth: Int(self.size.width*0.5), topCapHeight: Int(self.size.height*0.5))
        
        return resizeImage
    }
    
    
    /// clip an UIImage in rect
    ///
    /// - Parameter clipRect: the rect want to clip
    /// - Returns: the clipped UIImage
    func clipImage(in clipRect: CGRect) -> UIImage? {
        let scale = UIScreen.main.scale
        let clipX = clipRect.origin.x * scale
        let clipY = clipRect.origin.y * scale
        let clipWidth = clipRect.width * scale
        let clipHeight = clipRect.height * scale
        let clipImage = self.cgImage?.cropping(to: CGRect(x: clipX, y: clipY, width: clipWidth, height: clipHeight))
        
        guard clipImage != nil else {
            fatalError("2x or 3x Scaled image may be nil!!! Please check Assets Image source!!!")
        }
        
        return UIImage(cgImage: clipImage!)
    }
}

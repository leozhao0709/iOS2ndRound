//
//  UIImageExtension.swift
//  拉伸图片
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

extension UIImage {
    func strechImage(image: UIImage?) -> UIImage? {
        var resizeImage = image
        
        if let image = image {
            resizeImage = image.stretchableImage(withLeftCapWidth: Int(image.size.width*0.5), topCapHeight: Int(image.size.height*0.5))
        }
        
        return resizeImage
    }
}

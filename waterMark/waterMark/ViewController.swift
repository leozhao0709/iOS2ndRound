//
//  ViewController.swift
//  waterMark
//
//  Created by Lei Zhao on 1/8/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "阿狸头像")
        // 0.0 scale will use the default device scale
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0.0)
        image?.draw(at: CGPoint.zero)
        
        let str: NSString = "waterMark"
        str.draw(at: CGPoint.zero, withAttributes: nil)
        
        let getImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.imageView.image = getImage
    }


}


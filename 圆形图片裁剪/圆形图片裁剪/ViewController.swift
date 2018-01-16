//
//  ViewController.swift
//  圆形图片裁剪
//
//  Created by Lei Zhao on 1/9/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0)
//
//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.imageView.bounds.width, height: self.imageView.bounds.height))
//        path.addClip()
//
//        let ctx = UIGraphicsGetCurrentContext()
//        self.imageView.layer.render(in: ctx!)
//        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        
        let image = #imageLiteral(resourceName: "阿狸头像").circleImage(withBorderWidth: 10, andBorderColor: UIColor.orange)
        self.imageView.image = image

    }


}


//
//  ViewController.swift
//  拉伸图片
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let image = #imageLiteral(resourceName: "buttongreen")
        let image = #imageLiteral(resourceName: "chat_send_nor")
        
//        let resizeImage = image.stretchableImage(withLeftCapWidth: Int(image.size.width*0.5), topCapHeight: Int(image.size.height*0.5))
        let resizeImage = image.strechImage(image: image)
        self.imageView.image = resizeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


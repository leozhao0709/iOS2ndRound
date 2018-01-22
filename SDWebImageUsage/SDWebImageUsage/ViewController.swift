//
//  ViewController.swift
//  SDWebImageUsage
//
//  Created by Lei Zhao on 1/21/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.imageType()
    }
    
    private func gif() {
        print(#function)
//        self.imageView.sd_setImage(with: URL(string: "http://static.piggif.com/gif/0/fa97f274fef884944a5c01f1265ccc58.gif"), placeholderImage: nil)

        let image = UIImage.sd_animatedGIFNamed("fa97f274fef884944a5c01f1265ccc58")
        self.imageView.image = image
    }
    
    private func imageType() {
        guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "fa97f274fef884944a5c01f1265ccc58.gif", ofType: nil)!)) else {
            print("invalid path")
            return
        }
        let type = NSData.sd_contentType(forImageData: imageData)!
        print(type)
    }
}


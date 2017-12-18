//
//  ViewController.swift
//  拳皇
//
//  Created by Lei Zhao on 12/17/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var standImages:[UIImage]=[]
    var smallZhaoImages:[UIImage]=[]
    var bigZhaoImages:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.standImages = self.loadImage(prefix: "stand", count: 10)
        self.bigZhaoImages = self.loadImage(prefix: "dazhao", count: 87)
        self.smallZhaoImages = self.loadImage(prefix: "xiaozhao3", count: 39)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

extension ViewController {
    @IBAction func stand() {
        self.animation(animationsImages: self.standImages, repeatCount: 0, duration: 0.6, isStand: true)
    }
    
    @IBAction func smallZhao() {
        self.animation(animationsImages: self.smallZhaoImages, repeatCount: 1, duration: 2, isStand: false)
    }
    
    @IBAction func bigZhao() {
        self.animation(animationsImages: self.bigZhaoImages, repeatCount: 1, duration: 3, isStand: false)
    }
    
    @IBAction func stop() {
        self.imageView.stopAnimating()
    }
    
}

extension ViewController {
    func loadImage(prefix: String, count: Int) -> [UIImage] {
        var images:[UIImage] = []
        for i in 1...count {
            let imageName = "\(prefix)_\(i)"
            let image = UIImage(named: imageName)
            images.append(image!)
        }
        
        return images
    }
    
    func animation(animationsImages:[UIImage], repeatCount: Int, duration: TimeInterval, isStand: Bool) {

        self.imageView.animationImages = animationsImages
        self.imageView.animationDuration = duration
        self.imageView.animationRepeatCount = repeatCount
        
        self.imageView.startAnimating()
        
    }
    
}


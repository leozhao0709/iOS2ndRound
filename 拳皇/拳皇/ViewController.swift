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
    var standImages:[UIImage]?=[]
    var smallZhaoImages:[UIImage]?=[]
    var bigZhaoImages:[UIImage]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

extension ViewController {
    @IBAction func stand() {
        self.standImages = self.loadImage(prefix: "stand", count: 10)
        self.loadAnimation(animationsImages: &self.standImages, repeatCount: 0, duration: 0.6, isStand: true)
    }
    
    @IBAction func smallZhao() {
        self.smallZhaoImages = self.loadImage(prefix: "xiaozhao3", count: 39)
        self.loadAnimation(animationsImages: &self.smallZhaoImages, repeatCount: 1, duration: 2, isStand: false)
    }
    
    @IBAction func bigZhao() {
        self.bigZhaoImages = self.loadImage(prefix: "dazhao", count: 87)
        self.loadAnimation(animationsImages: &self.bigZhaoImages, repeatCount: 1, duration: 3, isStand: false)
    }
    
    @IBAction func stop() {
        self.bigZhaoImages = nil
        self.smallZhaoImages = nil
        self.standImages = nil
        
        self.imageView.stopAnimating()
        self.imageView.animationImages = nil
    }
    
}

extension ViewController {
    func loadImage(prefix: String, count: Int) -> [UIImage] {
        var images:[UIImage] = []
        for i in 1...count {
            let imageName = "\(prefix)_\(i)"
//            let image = UIImage(named: imageName)
            let imagePath = Bundle.main.path(forResource: imageName, ofType: "png")
            let image = UIImage(contentsOfFile: imagePath!)
            images.append(image!)
        }
        
        return images
    }
    
    func loadAnimation(animationsImages:inout [UIImage]?, repeatCount: Int, duration: TimeInterval, isStand: Bool) {
        
        var animationsImages = animationsImages
        self.imageView.animationImages = animationsImages
        self.imageView.animationDuration = duration
        self.imageView.animationRepeatCount = repeatCount
        
        self.imageView.startAnimating()
        
        animationsImages = nil
    }
    
}


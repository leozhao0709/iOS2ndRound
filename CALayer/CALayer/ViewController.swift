//
//  ViewController.swift
//  CALayer
//
//  Created by Lei Zhao on 1/11/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.imageView.frame)
        self.imageView.layer.cornerRadius = 10
        
        self.imageView.layer.borderColor = UIColor.green.cgColor
        self.imageView.layer.borderWidth = 2
        
        self.imageView.layer.masksToBounds = true
        self.imageView.backgroundColor = UIColor.red
        print(self.imageView.frame)
    }
    
    private func redViewLayer() {
        self.redView.layer.shadowColor = UIColor.blue.cgColor
        self.redView.layer.shadowOpacity = 1
        self.redView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.redView.layer.shadowRadius = 5
        
        self.redView.layer.cornerRadius = 50
        
        self.redView.layer.borderColor = UIColor.green.cgColor
        self.redView.layer.borderWidth = 2;
    }

}


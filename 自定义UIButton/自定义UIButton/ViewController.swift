//
//  ViewController.swift
//  自定义UIButton
//
//  Created by Lei Zhao on 12/19/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = CustomButton(frame: CGRect(x: 100, y: 100, width: 170, height: 70))

        button.setImage(#imageLiteral(resourceName: "miniplayer_btn_playlist_normal"), for: .normal)
        button.imageView?.backgroundColor = UIColor.orange
        button.setTitle("Button", for: .normal)
        button.titleLabel?.backgroundColor = UIColor.blue
        button.backgroundColor = UIColor.green
        
        self.view.addSubview(button)
    }


}


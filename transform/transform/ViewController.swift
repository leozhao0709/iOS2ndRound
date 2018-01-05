//
//  ViewController.swift
//  transform
//
//  Created by Lei Zhao on 1/4/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var transformView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.transformView.transform  = self.transformView.transform.translatedBy(x: 0, y: -30)
        }
    }
    
    @IBAction func moveDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.transformView.transform  = self.transformView.transform.translatedBy(x: 0, y: 30)
        }
    }
    
    @IBAction func rotate(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.transformView.transform = self.transformView.transform.rotated(by: CGFloat.pi * 0.5)
        }
    }
    
    @IBAction func scale(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.transformView.transform = self.transformView.transform.scaledBy(x: 0.8, y: 0.8)
        }) { (finish) in
            if finish {
                UIView.animate(withDuration: 0.5, animations: {
                    self.transformView.transform = self.transformView.transform.scaledBy(x: 2, y: 2)
                }, completion: { (finish) in
                    if finish {
                        UIView.animate(withDuration: 0.5, animations: {
                            self.transformView.transform = self.transformView.transform.scaledBy(x: 1/1.6, y: 1/1.6)
                        })
                    }
                })
            }
        }
    }
    
    
}


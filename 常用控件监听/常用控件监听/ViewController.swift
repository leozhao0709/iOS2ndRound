//
//  ViewController.swift
//  常用控件监听
//
//  Created by Lei Zhao on 12/20/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    weak var textFiled: UITextField?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let segment = UISegmentedControl(items: ["123", "234", "345", "567"])
        segment.selectedSegmentIndex = 0;
        segment.center = CGPoint(x: self.view.center.x, y: 200)
        self.view.addSubview(segment)
        
        segment.addTarget(self, action: #selector(self.segmentClick(segement:)), for: .valueChanged )
        
        let textFiled = UITextField(frame: CGRect(x: self.view.center.x-60, y: 300, width: 120, height: 30))
        textFiled.borderStyle = .roundedRect
        self.view.addSubview(textFiled)
        textFiled.delegate = self
        
        self.textFiled = textFiled
    }
    
    @objc private func segmentClick(segement: UISegmentedControl) {
        NSLog("click segment \(segement.selectedSegmentIndex)")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("text filed begin editing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("text filed did end editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        NSLog("shouldChangeCharactersIn------\(string)")
        if string == "1" {
            return true
        }
        return false;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.textFiled?.resignFirstResponder()
//        self.textFiled?.endEditing(true)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


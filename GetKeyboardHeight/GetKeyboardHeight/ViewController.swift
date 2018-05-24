//
//  ViewController.swift
//  GetKeyboardHeight
//
//  Created by Lei Zhao on 4/20/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    @objc func keyboardWillAppear(notification: NSNotification) {
        print("....UIScreen height.....\(UIScreen.main.bounds.height)")
        print("....UIScreen width.....\(UIScreen.main.bounds.width)")
        //Do something here
        // UIKeyboardBoundsUserInfoKey  
        print(notification)
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification) {
        //Do something here
        print(notification)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }

}


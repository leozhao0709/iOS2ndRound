//
//  ViewController.swift
//  pickerView
//
//  Created by Lei Zhao on 1/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var countryTF: FlagTextField!
    @IBOutlet weak var birthTF: BirthTextField!
    @IBOutlet weak var areaTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryTF.delegate = self
        self.birthTF.delegate = self
        self.areaTF.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.initalText()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

}


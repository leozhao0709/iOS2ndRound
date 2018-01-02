//
//  AreaTextField.swift
//  pickerView
//
//  Created by Lei Zhao on 1/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class AreaTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    weak var pickerView: UIPickerView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.setup()
    }
    
    private func setup() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.inputView = pickerView
        self.pickerView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

}

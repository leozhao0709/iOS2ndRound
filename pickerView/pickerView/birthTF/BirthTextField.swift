//
//  BirthTextField.swift
//  pickerView
//
//  Created by Lei Zhao on 1/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class BirthTextField: UITextField {
    
    @objc weak var datePicker: UIDatePicker?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    private func setupUI() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateSelect(datePicker:)), for: .valueChanged)
        self.inputView = datePicker
        
        self.datePicker = datePicker
    }
    
    override func initalText() {
        self.dateSelect(datePicker: self.datePicker!)
    }
    
    @objc
    private func dateSelect(datePicker: UIDatePicker) {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        
        self.text = fmt.string(from: datePicker.date)
    }
    
}

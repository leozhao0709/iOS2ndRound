//
//  FlagTextField.swift
//  pickerView
//
//  Created by Lei Zhao on 1/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension

class FlagTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {

    private weak var pickerView: UIPickerView?;
    lazy private var flagArray: [Flag] = {
        return Flag.mj_objectArray(withFilename: "flags.plist") as! [Flag]
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func initalText() {
        self.pickerView(self.pickerView!, didSelectRow: (self.pickerView?.selectedRow(inComponent: 0))!, inComponent: 0)
    }
    
    private func setupUI() {
        let pickerView = UIPickerView()
        self.inputView = pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.clear
        self.pickerView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.flagArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let flagView = FlagView.loadView()
        flagView.flag = self.flagArray[row]
        
        return flagView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let flag = self.flagArray[row]
        self.text = flag.name
    }
}

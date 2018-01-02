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
    
    private func setupUI() {
        let pickerView = UIPickerView()
        self.inputView = pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.pickerView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.flagArray.count
    }
}

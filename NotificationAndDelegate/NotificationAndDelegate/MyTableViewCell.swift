//
//  MyTableViewCell.swift
//  NotificationAndDelegate
//
//  Created by Lei Zhao on 12/28/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var indexPath: IndexPath?
    weak var delegate: MyTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    @IBAction func plusBtnClick(_ sender: UIButton) {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "plusBtnClick"), object: self, userInfo: ["type": "plus btn", "indexPath": self.indexPath!])
        if let delegate = self.delegate {
            delegate.myTableViewCell(cell: self, plusBtnClick: sender)
        }
    }
    
    @IBAction func minusBtnClick(_ sender: UIButton) {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "minusBtnClick"), object: self, userInfo: ["type": "minus btn", "indexPath": self.indexPath!])
        if let delegate = self.delegate {
            delegate.myTableViewCell(cell: self, minusBtnClick: sender)
        }
    }
}

protocol MyTableViewCellProtocol: NSObjectProtocol {
    func myTableViewCell(cell: MyTableViewCell, plusBtnClick plusBtn: UIButton)
    func myTableViewCell(cell: MyTableViewCell, minusBtnClick minusBtn: UIButton)
}

//
//  FlagView.swift
//  pickerView
//
//  Created by Lei Zhao on 1/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class FlagView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        var frame = self.frame
        frame.size.width = UIScreen.main.bounds.width
        self.frame = frame
    }
    
    static func loadView() -> FlagView {
        return Bundle.main.loadNibNamed(String(describing: FlagView.self), owner: self, options: nil)?.first as! FlagView
    }
    
    var flag: Flag! {
        didSet {
            self.label.text = flag.name
            self.imageView.image = UIImage(named: flag.icon!)
        }
    }

}

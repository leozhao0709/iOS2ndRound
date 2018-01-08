//
//  AppCell.swift
//  collectionView
//
//  Created by Lei Zhao on 1/8/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
//    weak var label: UILabel?
//    weak var imageView: UIImageView?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var app: AppModel? {
        didSet {
            self.label?.text = self.app?.name
            self.imageView?.image = UIImage(named: (self.app?.icon)!)
        }
    }
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height-20))
//        
//        let label = UILabel(frame: CGRect(x: 0, y: imageView.frame.maxY, width: self.frame.width, height: 20))
//        label.textAlignment = .center
//        self.contentView.addSubview(imageView)
//        self.contentView.addSubview(label)
//        
//        self.imageView = imageView
//        self.label = label
//    }
  
}

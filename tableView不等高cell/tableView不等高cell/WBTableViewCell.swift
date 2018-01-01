//
//  WBTableViewCell.swift
//  tableView不等高cell
//
//  Created by Lei Zhao on 12/27/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class WBTableViewCell: UITableViewCell {
    
    weak var iconImageView: UIImageView?
    weak var nameLabel: UILabel?
    weak var text_label: UILabel?
    weak var vipImageView: UIImageView?
    weak var pictureImageView: UIImageView?
    
    var status: Status?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
        
        self.iconImageView?.frame = (status?.iconFrame)!
        self.iconImageView?.image = UIImage(named: (status?.icon)!)
        self.nameLabel?.frame = (status?.nameFrame)!
        self.nameLabel?.text = status?.name
        self.text_label?.frame = (status?.textFrame)!
        self.text_label?.text = status?.text
        if (self.status?.vip)! {
            self.vipImageView?.frame = (status?.vipFrame)!
            self.vipImageView?.isHidden = false
            self.nameLabel?.textColor = UIColor.orange
        } else {
            self.vipImageView?.isHidden = true
            self.nameLabel?.textColor = UIColor.black
        }
        if self.status?.picture != nil {
            self.pictureImageView?.frame = (status?.pictureFrame)!
            self.pictureImageView?.image = UIImage(named: (status?.picture)!)
            self.pictureImageView?.isHidden = false
        } else {
            self.pictureImageView?.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let iconImageView = UIImageView()
        let nameLabel = UILabel()
        let text_label = UILabel()
        text_label.numberOfLines = 0
        let vipImageView = UIImageView()
        vipImageView.image = #imageLiteral(resourceName: "vip")
        let pictureImageView = UIImageView()
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(text_label)
        self.contentView.addSubview(vipImageView)
        self.contentView.addSubview(pictureImageView)

        self.iconImageView = iconImageView
        self.nameLabel = nameLabel
        self.text_label = text_label
        self.vipImageView = vipImageView
        self.pictureImageView = pictureImageView
        
    }
    
}

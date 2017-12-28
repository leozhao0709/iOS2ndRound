//
//  Status.swift
//  tableView不等高cell
//
//  Created by Lei Zhao on 12/27/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit
@objcMembers
class Status: NSObject {
    var text: String?
    var icon: String?
    var name: String?
    var picture: String?
    var vip: Bool = false
    
    var textFrame: CGRect?
    var iconFrame: CGRect?
    var nameFrame: CGRect?
    var vipFrame: CGRect?
    var pictureFrame: CGRect?
    
    var _cellHeight: CGFloat = 0
    var cellHeight: CGFloat {
        get {
            var newHeight: CGFloat = self._cellHeight
            if newHeight == 0 {
                let space: CGFloat = 10
                
                let iconX: CGFloat = space
                let iconY: CGFloat = space
                let iconWH: CGFloat = 30
                self.iconFrame = CGRect(x: iconX, y: iconY, width: iconWH, height: iconWH)
                
                let nameX: CGFloat = (self.iconFrame?.maxX)! + space
                let nameY: CGFloat = iconY
                let nameArr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)]
                let nameW = self.name?.size(withAttributes: nameArr).width
                let nameH = self.name?.size(withAttributes: nameArr).height
                self.nameFrame = CGRect(x: nameX, y: nameY, width: nameW!, height: nameH!)
                
                if self.vip {
                    let vipX = (self.nameFrame?.maxX)! + space
                    let vipY: CGFloat = nameY
                    let vipWH: CGFloat = 14
                    self.vipFrame = CGRect(x: vipX, y: vipY, width: vipWH, height: vipWH)
                }
                
                let textX: CGFloat = iconX
                let textY: CGFloat = (self.iconFrame?.maxY)! + space
                let textW: CGFloat = UIScreen.main.bounds.width - 2 * space
                let textArr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
                let textMaxSize = CGSize(width: textW, height: CGFloat(MAXFLOAT))
                let textH = self.text?.boundingRect(with: textMaxSize, options: .usesLineFragmentOrigin, attributes: textArr, context: nil).height
                self.textFrame = CGRect(x: textX, y: textY, width: textW, height: textH!)
                
                if (self.picture != nil) {
                    let pictureWH: CGFloat = 100
                    let pictureX: CGFloat = iconX
                    let pictureY: CGFloat = (self.textFrame?.maxY)! + space
                    self.pictureFrame = CGRect(x: pictureX, y: pictureY, width: pictureWH, height: pictureWH)
                    newHeight = (self.pictureFrame?.maxY)! + space
                } else {
                    newHeight = (self.textFrame?.maxY)! + space
                }
            }
            return newHeight
        }
        set {
            self._cellHeight = newValue
        }
    }
}

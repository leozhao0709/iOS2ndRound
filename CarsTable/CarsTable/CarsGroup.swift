//
//  CarsGroup.swift
//  CarsTable
//
//  Created by Lei Zhao on 12/25/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension
@objcMembers
class CarsGroup: NSObject {
    var title: String?
    var cars: [Car]?
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["cars": Car.self]
    }
}

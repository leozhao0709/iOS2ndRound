//
//  MyView.swift
//  CAReplicationLayer
//
//  Created by Lei Zhao on 1/16/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class MyView: UIView {
    override class var layerClass: AnyClass {
        return CAReplicatorLayer.self
    }
}

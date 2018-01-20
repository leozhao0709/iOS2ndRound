//
//  MyOperation.swift
//  NSOperation
//
//  Created by Lei Zhao on 1/19/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class MyOperation: Operation {
    
    override func main() {
        print("---download...-----\(Thread.current)")
    }
}

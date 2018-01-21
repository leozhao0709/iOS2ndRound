//
//  ViewController.swift
//  NSOperation
//
//  Created by Lei Zhao on 1/19/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.myOperationDemo()
        self.blockOperationDemo()
    }
    
    private func myOperationDemo() {
        let op1 = MyOperation()
        let op2 = MyOperation()
        let op3 = MyOperation()
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 3
        
        
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        operationQueue.addOperation(op3)
    }

    private func blockOperationDemo() {
        let op1 = BlockOperation {
            print("---download1-----\(Thread.current)")
        }
        let op2 = BlockOperation {
            print("---download2-----\(Thread.current)")
        }
        let op3 = BlockOperation {
            print("---download3-----\(Thread.current)")
        }
        
        op3.addDependency(op2)
        op3.addDependency(op1)

        let operationQueue = OperationQueue()
        operationQueue.addOperation(op1)
        operationQueue.addOperation(op2)
        operationQueue.addOperation(op3)
    }
}


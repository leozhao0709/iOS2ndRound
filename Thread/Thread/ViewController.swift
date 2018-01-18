//
//  ViewController.swift
//  Thread
//
//  Created by Lei Zhao on 1/17/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ticketsCountLabel: UILabel!
    var totalCount = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.ticketsCountLabel.text = "\(self.totalCount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetTickets(_ sender: UIButton) {
        self.totalCount = 100
        self.setTicketsCountLabel(object: self.totalCount)
    }
    
    
    @IBAction func startSell(_ sender: UIButton) {
        let threadA = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
        let threadB = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
        let threadC = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
        
        threadA.name = "A"
        threadB.name = "B"
        threadC.name = "C"
        
        threadA.start()
        threadB.start()
        threadC.start()
    }
    
    
    // 卖票例子
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let threadA = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
//        let threadB = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
//        let threadC = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
//
//        threadA.name = "A"
//        threadB.name = "B"
//        threadC.name = "C"
//
//        threadA.start()
//        threadB.start()
//        threadC.start()
//    }
    
    @objc
    private func sellTicket() {
        
        while true {
            objc_sync_enter(self)
            let count = self.totalCount
            if count > 0 {
                for _ in 0..<10000000 {

                }
                self.totalCount = count - 1;
                print("-----\(String(describing: Thread.current.name!))----left \(self.totalCount) tickets")
                self.performSelector(onMainThread: #selector(self.setTicketsCountLabel(object:)), with: self, waitUntilDone: true)
            } else {
                print("-----\(String(describing: Thread.current.name!))----all tickets were sold out")
//                break
                
                
                Thread.exit()
            }
            objc_sync_exit(self)
        }
    }
    
    @objc
    private func setTicketsCountLabel(object: Any) {
        print(object)
        self.ticketsCountLabel.text = "\((object as! ViewController).totalCount)"
    }

}


//
//  ViewController.swift
//  NotificationAndDelegate
//
//  Created by Lei Zhao on 12/28/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

let myTableViewCellIdentifier = "MyTableViewCell"

class ViewController: UIViewController, UITableViewDataSource, MyTableViewCellProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        
        self.tableView.register( UINib(nibName: "MyTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: myTableViewCellIdentifier)
        self.tableView.rowHeight = 44
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.plusBtnClick(notification:)), name: NSNotification.Name(rawValue: "plusBtnClick"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.minusBtnClick(notification:)), name: NSNotification.Name(rawValue: "minusBtnClick"), object: nil)
    }
    
//    @objc
//    private func plusBtnClick(notification: Notification) {
//        let indexPath = notification.userInfo!["indexPath"] as! IndexPath
//        print("\(indexPath.row) plus btn click")
//    }
//
//    @objc
//    private func minusBtnClick(notification: Notification) {
//        let indexPath = notification.userInfo!["indexPath"] as! IndexPath
//        print("\(indexPath.row) minus btn click")
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myTableViewCellIdentifier) as! MyTableViewCell
        cell.textLabel?.text = "cell \(indexPath.row)"
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func myTableViewCell(cell: MyTableViewCell, plusBtnClick plusBtn: UIButton) {
        print("\(cell.indexPath!.row) plus btn click")
    }
    
    func myTableViewCell(cell: MyTableViewCell, minusBtnClick minusBtn: UIButton) {
        print("\(cell.indexPath!.row) minus btn click")
    }
}


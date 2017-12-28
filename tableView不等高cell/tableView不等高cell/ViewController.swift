//
//  ViewController.swift
//  tableView不等高cell
//
//  Created by Lei Zhao on 12/27/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension

let WBCell = "WBCell"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var statusArray:[Status] = {
       return Status.mj_objectArray(withFilename: "statuses.plist") as! [Status]
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.register(WBTableViewCell.self, forCellReuseIdentifier: WBCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableView dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell: WBTableViewCell = tableView.dequeueReusableCell(withIdentifier: WBCell) as! WBTableViewCell
        let status = self.statusArray[indexPath.row]
        cell.status = status
        return cell
    }
    
    // MARK: - tableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("heightForRowAt")
        return self.statusArray[indexPath.row].cellHeight
    }
}


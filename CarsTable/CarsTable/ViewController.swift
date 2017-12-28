//
//  ViewController.swift
//  CarsTable
//
//  Created by Lei Zhao on 12/25/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension

let carCellIdentifier = "CarCell"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var carGroups:[CarsGroup] = {
        return CarsGroup.mj_objectArray(withFilename: "cars.plist") as! [CarsGroup]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: carCellIdentifier)

        self.tableView.sectionIndexColor = UIColor.cyan
        self.tableView.sectionIndexBackgroundColor = UIColor.orange
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.carGroups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.carGroups[section].cars?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: carCellIdentifier)
        
        let car = self.carGroups[indexPath.section].cars![indexPath.row]
        cell?.textLabel?.text = car.name
        cell?.imageView?.image = UIImage(named: car.icon!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.carGroups[section].title
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles:[String]? = []
        for carGroup in self.carGroups {
            titles?.append(carGroup.title!)
        }
        
        return titles
    }
    
    // 左滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.carGroups[indexPath.section].cars?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }
//
//    // change左滑删除title
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "删除"
//    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "删除") { (action, indexPath) in
            self.carGroups[indexPath.section].cars?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
        
        let guanzhu = UITableViewRowAction(style: .normal, title: "关注") { (action, indexPath) in
            tableView.isEditing = false
        }
//        guanzhu.backgroundColor = UIColor.gray
        return [delete, guanzhu]
    }
    
}


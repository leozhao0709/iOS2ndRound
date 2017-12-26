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

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    lazy var carGroups:[CarsGroup] = {
//        let path = Bundle.main.path(forResource: "cars", ofType: "plist")
//        let carsArray = NSArray(contentsOfFile: path!)
//
//        var tempArray:[CarsGroup] = []
//        for cars in carsArray! {
//            let carGroup = CarsGroup(dict: cars as! [String : AnyObject])
//            tempArray.append(carGroup)
//        }
//
//        return tempArray
        
//        CarsGroup.mj_setupObjectClass(inArray: { () -> [AnyHashable : Any]? in
//            return ["cars": Car.self]
//        })
        
        return CarsGroup.mj_objectArray(withFilename: "cars.plist") as! [CarsGroup]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: carCellIdentifier)
//        self.tableView.register( UINib(nibName: NSStringFromClass(TableViewCell.self), bundle: nil), forCellReuseIdentifier: carCellIdentifier)
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
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: carCellIdentifier)
//        }
        
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

}


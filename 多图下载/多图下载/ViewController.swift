//
//  ViewController.swift
//  多图下载
//
//  Created by Lei Zhao on 1/20/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension
import SDWebImage

let appCellIdentifier = "AppCellIndentifier"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var appsArray: [AppModel] = {
       return AppModel.mj_objectArray(withFilename: "apps.plist") as! [AppModel]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: appCellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: appCellIdentifier)
        }
        
        let app = self.appsArray[indexPath.row]
        cell?.textLabel?.text = app.name
        cell?.detailTextLabel?.text = app.download
        
        cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"))
        
//        cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"), options: SDWebImageOptions.retryFailed, progress: { (receivedSize, expectedSize) in
//            let percentage: Float = Float(receivedSize/expectedSize)
//            print(percentage)
//        }, completed: { (image, error, cacheType, url) in
//            print(cacheType.rawValue)
//        })
        return cell!
    }
    
}


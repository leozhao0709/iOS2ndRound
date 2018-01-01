//
//  ViewController.swift
//  UIApplication
//
//  Created by Lei Zhao on 12/31/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
    }
    
    override func loadView() {
        super.loadView()
        print("load view")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setBadge(_ sender: UIButton) {
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 10
    }
    

    @IBAction func setNetState(_ sender: UIButton) {
        let app = UIApplication.shared
        app.isNetworkActivityIndicatorVisible = !app.isNetworkActivityIndicatorVisible
    }
    
    
    @IBAction func setStatusBar(_ sender: UIButton) {
        let app = UIApplication.shared
        app.isStatusBarHidden = !app.isStatusBarHidden
        app.statusBarStyle = .lightContent
    }
    
    
    @IBAction func openUrl(_ sender: UIButton) {
        let app = UIApplication.shared
        let url = URL(string: "https://google.com")
        app.openURL(url!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


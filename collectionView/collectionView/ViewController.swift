//
//  ViewController.swift
//  collectionView
//
//  Created by Lei Zhao on 1/8/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit
import MJExtension

let cellIdentifier = "appCell"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    weak var collectionView: UICollectionView?
    lazy var appArray:[AppModel] = {
        return AppModel.mj_objectArray(withFilename: "app.plist") as! [AppModel]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .horizontal
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 250), collectionViewLayout: flowLayout)
//        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView = collectionView
        self.view.addSubview(collectionView)
        
//        collectionView.register(AppCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        
        collectionView.register(UINib(nibName: String(describing: AppCell.self), bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppCell
        
        cell.app = self.appArray[indexPath.item]
        return cell
    }


}


//
//  ViewController.swift
//  scrollView分页
//
//  Created by Lei Zhao on 12/20/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageCtrol: UIPageControl!

    let imageCount = 5
    
    weak var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpScollView()
        self.setUpPageControl()
        
        self.initialTimer()
    }
    
    private func initialTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.setupTimer(timer:)), userInfo: "timertimer", repeats: true)
        let mainLoop = RunLoop.main
        mainLoop.add(self.timer!, forMode: RunLoopMode.commonModes)
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
    }
    
    @objc private func setupTimer(timer: Timer) {
//        NSLog(timer.userInfo as! String)
        var nextPage = self.pageCtrol.currentPage + 1
        
        if nextPage == imageCount {
            nextPage = 0
        }
        self.scrollView.setContentOffset(CGPoint(x: CGFloat(nextPage) * self.scrollView.frame.width, y: 0) , animated: true)
        self.pageCtrol.currentPage = nextPage
    }
	
    private func setUpPageControl() {
        self.pageCtrol.numberOfPages = imageCount
        self.pageCtrol.hidesForSinglePage = true
        self.pageCtrol.isUserInteractionEnabled = false
        
        self.pageCtrol.setValue(UIImage(named: "current"), forKeyPath:"_currentPageImage")
        self.pageCtrol.setValue(UIImage(named: "other"), forKeyPath: "_pageImage")
    }
    
    private func setUpScollView() {
        let imageWidth: CGFloat = 300.0
        let imageHeight: CGFloat = 130.0
        for i in 1...imageCount {
            let image = UIImage(named: String(format: "img_0%d", i))
            let imageView = UIImageView(frame: CGRect(x: imageWidth * (CGFloat)(i-1), y: 0, width: imageWidth, height: imageHeight))
            imageView.image = image
            self.scrollView.addSubview(imageView)
        }
        
        self.scrollView.contentSize = CGSize(width: imageWidth * CGFloat(imageCount), height: imageHeight)
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        self.scrollView.delegate = self
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentPage = (self.scrollView.contentOffset.x / self.scrollView.frame.width).rounded()
        self.pageCtrol.currentPage = Int(currentPage)
        self.initialTimer()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.stopTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


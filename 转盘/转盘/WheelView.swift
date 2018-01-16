//
//  WheelView.swift
//  转盘
//
//  Created by Lei Zhao on 1/15/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class WheelView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    weak var selectedBtn: UIButton?
    
    lazy var displayLink: CADisplayLink? = {
        let displayLink = CADisplayLink(target: self, selector: #selector(self.rotate))
        displayLink.add(to: .main, forMode: .commonModes)
        return displayLink
    }()
    
    static func loadWheelView() -> WheelView{
        let wheelView = Bundle.main.loadNibNamed(String(describing: WheelView.self), owner: nil, options: nil)?.last as! WheelView
        wheelView.imageView.isUserInteractionEnabled = true
        return wheelView
    }
    
    override func awakeFromNib() {
        
        let btnOriginalImage = #imageLiteral(resourceName: "LuckyAstrology")
        let btnSelectedImage = #imageLiteral(resourceName: "LuckyAstrologyPressed")
        
        var angle: CGFloat = 0
        for i in 0...11 {
            let btn = WheelButton()

            btn.bounds = CGRect(x: 0, y: 0, width: 68, height: 143)
            btn.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            btn.layer.position = self.center
            
            let selectedImage = #imageLiteral(resourceName: "LuckyRototeSelected")
            btn.setBackgroundImage(selectedImage, for: .selected)
            btn.transform = CGAffineTransform(rotationAngle: angle/180 * CGFloat.pi)
            angle += 30
            self.imageView.addSubview(btn)
            
            let clipRect = CGRect(x: CGFloat(i) * btnOriginalImage.size.width/12, y: 0, width: btnOriginalImage.size.width/12, height: btnOriginalImage.size.height)

            let btnNormalClipImage = btnOriginalImage.clipImage(in: clipRect)
            btn.setImage(btnNormalClipImage, for: .normal)
            
            let btnSelectedClipImage = btnSelectedImage.clipImage(in: clipRect)
            btn.setImage(btnSelectedClipImage, for: .selected)
            
            btn.addTarget(self, action: #selector(self.btnClick(btn:)), for: .touchUpInside)
            
            if i == 0 {
                self.btnClick(btn: btn)
            }
        }
    }
    
    @objc
    private func btnClick(btn: UIButton) {
        if let selectedBtn = self.selectedBtn {
            selectedBtn.isSelected = false
        }
        btn.isSelected = true
        self.selectedBtn = btn
    }
    
    @objc
    private func rotate() {
        self.transform = self.transform.rotated(by: CGFloat.pi/150)
    }
    
    func startRotate() {
        self.displayLink?.isPaused = false
    }
    
    func pauseRotate() {
        self.displayLink?.isPaused = true
    }
    
    deinit {
        self.displayLink?.remove(from: .main, forMode: .commonModes)
    }
}

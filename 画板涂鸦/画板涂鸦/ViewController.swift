//
//  ViewController.swift
//  画板涂鸦
//
//  Created by Lei Zhao on 1/11/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, HandleImageViewDelegate {
    
    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.drawView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DrawView(drawView: DrawView, pathArray: [Any]?) {
        self.saveBtn.isEnabled = pathArray?.count != 0
    }

    @IBAction func setColor(_ sender: UIButton) {
        self.drawView.drawColor = sender.backgroundColor!
    }
    
    @IBAction func setLineWidth(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        self.drawView.drawWidth = value
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        self.drawView.clear()
    }
    
    @IBAction func undo(_ sender: UIBarButtonItem) {
        self.drawView.undo()
    }
    
    @IBAction func erase(_ sender: UIBarButtonItem) {
        self.drawView.erase()
    }
    
    @IBAction func getPhotos(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        
        let handleImageView = HandleImageView()
        handleImageView.frame = self.drawView.frame
        handleImageView.image = image
        
        handleImageView.delegate = self
        self.view.addSubview(handleImageView)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, false, 0)
        let ctx = UIGraphicsGetCurrentContext()
        self.view.layer.render(in: ctx!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        var message = ""
        if error == nil {
            message = "save successfully!!!"
        } else {
            message = "save failed!"
        }
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func handleImageView(handleImageView: HandleImageView, image: UIImage) {
        self.drawView.image = image
    }
    
}


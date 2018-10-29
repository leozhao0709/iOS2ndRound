# Photos

## 1. write image to user photo library

```swift
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
```

Note:

- We are using `UIImageWriteToSavedPhotosAlbum` to write image to user photos library. But this method, we **must implements** `image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer)` this objc method and **use this in selector**.
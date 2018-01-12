# UIAlertController

## 1. create alert controller

```swift
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
```
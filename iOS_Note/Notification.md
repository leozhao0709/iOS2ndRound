# Notification center

## 1. Post notification

```swift
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "plusBtnClick"), object: self, userInfo: ["type": "plus btn", "indexPath": self.indexPath!])
```

Note:

* `name` is the notification name we are using to post. Just like an identifier and we need use this name when we add observer.

* `object` is used to get who post the notification

## 2. Add observer

```swift
override func viewDidLoad() {
  super.viewDidLoad()
  NotificationCenter.default.addObserver(self, selector: #selector(self.plusBtnClick(notification:)), name: NSNotification.Name(rawValue: "plusBtnClick"), object: nil)
}

@objc
private func plusBtnClick(notification: Notification) {
    let indexPath = notification.userInfo!["indexPath"] as! IndexPath
    let object = notification.object
    print("\(indexPath.row) plus btn click")
}

deinit {
    NotificationCenter.default.removeObserver(self)
}
```

Note:

* The first parameter is `observer`. This means who receive and do a response for the notification.

* `selector` is the function that we want to do response. We can pass a notification object to this function to receive the notification object and userInfo.

* `name` is the notification name we are using to receive the notification

* `object` is used to indicate who post this notification. If we set this value to nil, it means we receive all the notification with the `notification name`, we don't care who post this notification.

* **We must add observer before post notification**

* **If we add an observer, we must remove it in deinit method**
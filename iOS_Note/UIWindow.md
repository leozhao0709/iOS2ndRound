# UIWindow

## 1. using code to create window

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    self.window = UIWindow(frame: UIScreen.main.bounds)
    let  rootController = UIViewController()
    rootController.view.backgroundColor = UIColor.cyan
    self.window?.rootViewController = rootController
    self.window?.makeKeyAndVisible()
}
```

Note: If we create window by ourselves, we must use  `self.window?.makeKeyAndVisible()` to make window visible

## 2. window level

We can use window level to set up different window level. Window Level is just a `CGFloat` after Xcode 9.
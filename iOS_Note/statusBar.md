# StatusBar

## 1. hide status bar and status bar style (Based on ViewController or global setting)

There are 2 ways to set these.

1. Set status bar **based on each ViewController**

    ```swift
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    ```

2. Set status bar **globally**

    First, in **info.plist**, add `View controller-based status bar appearance` and set the value to `No`.

    Then set it in code

    ```swift
    let app = UIApplication.shared
    app.isStatusBarHidden = !app.isStatusBarHidden
    app.statusBarStyle = .lightContent
    ```

## 2. show Network Activity Indicator (network 小菊花)

```swift
let app = UIApplication.shared
app.isNetworkActivityIndicatorVisible = !app.isNetworkActivityIndicatorVisible
```
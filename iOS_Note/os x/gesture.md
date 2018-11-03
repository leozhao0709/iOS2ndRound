# Gesture in mac OS

## 1. click gesture

```swift

func makeWebView() -> NSView {
    let webView = WKWebView()
    
    let gestureRecognizer = NSClickGestureRecognizer(target: self, action: #selector(self.selectWebView(gestureRecognizer:)))
    gestureRecognizer.delegate = self
    webView.addGestureRecognizer(gestureRecognizer)

    return webView
}

@objc
func selectWebView(gestureRecognizer: NSClickGestureRecognizer) {
    guard let webView = gestureRecognizer.view as? WKWebView else {return}
    
    if let selectedWebView = self.selectedWebView {
        selectedWebView.layer?.borderWidth = 0
    }
    
    self.selectedWebView = webView
    self.selectedWebView?.wantsLayer = true
    self.selectedWebView?.layer?.borderWidth = 4
    self.selectedWebView?.layer?.borderColor = NSColor.blue.cgColor
}

// gesture delegate
func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldAttemptToRecognizeWith event: NSEvent) -> Bool {
    if gestureRecognizer.view == self.selectedWebView {
        return false
    } else {
        return true
    }
}
```

Note:

-   To create a guesture, this is almost same with iOS gesture
-   `let gestureRecognizer = NSClickGestureRecognizer(target: self, action: #selector(self.selectWebView(gestureRecognizer:)))` to create a gesture
-   Then add your gesture to the view you want to add
-   You need to create an objc method with one parameter `gestureRecognizer: NSGesture`
-   You can set the gesture delegate to self, then your controller/view need to implement protocol `NSGestureRecognizerDelegate`
-   With delegate, there are many method you can use. Check the correct one you want to use.
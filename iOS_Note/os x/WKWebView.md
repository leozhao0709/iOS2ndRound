# WKWebView

## 0. gotcha

For showing a webView, you need set up this first.

![load webview](../images/osX/webViewNotice.png)

## 1. usage

```swift
import Cocoa
import WebKit
import SnapKit

class ViewController: NSViewController, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = self.makeWebView()
        self.view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func makeWebView() -> NSView {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.wantsLayer = true
        webView.load(URLRequest(url: URL(string:"https://www.apple.com")!))
        
        return webView
    }

    // delegate
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        guard let selectedWebView = self.selectedWebView else { return }
        
        if let windowController = self.view.window?.windowController as? WindowController {
            windowController.addressEntry.stringValue = selectedWebView.url?.absoluteString ?? ""
        }
    }
}
```

Note:

-   You need to import `WebKit` and your controller needs to implements protocol `WKNavigationDelegate`
-   `WKWebView` needs `wantsLayer` to show
-   `WKWebView` has the `load` method to load a `URLRequest`
-   `WKWebView` also has `goBack` and `goForward` method to go back or go forward of your web view
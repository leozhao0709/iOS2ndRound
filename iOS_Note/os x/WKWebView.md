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
}
```

Note:

-   You need to import `WebKit` and your controller needs to implements protocol `WKNavigationDelegate`
-   `WKWebView` needs `wantsLayer` to show
-   `webView` needs to load `URLRequest` to load a url
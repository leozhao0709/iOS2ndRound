# NSLayer

## 1. add border

```swift
self.selectedWebView?.wantsLayer = true
self.selectedWebView?.layer?.borderWidth = 4
self.selectedWebView?.layer?.borderColor = NSColor.blue.cgColor
```

Note:

-   You need to use `wantsLayer` first.
-   Border should be added to layer.

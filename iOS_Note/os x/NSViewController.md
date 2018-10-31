# NSViewController

## 1. usage

```swift
import Cocoa

class LeftViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    override func loadView() {
        self.view = NSView()

        // initial size
        self.view.setFrameSize(NSSize(width: 100, height: 0))
    }
}
```

Note:

-   You need to set up the `self.view` in `loadView()` if you don't use xib. This is not like the `UIViewController`
-   Please do any size related thing in `override func loadView()`
-   If you want to define background color, then please use `layer` and you need to set up `self.view.wantsLayer = true`


# NSSplitController

## 1. usage

```swift
import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.addChild(LeftViewController())
        self.addChild(RightViewController())
        
//        self.splitView.dividerStyle = .thin
//        self.splitView.isVertical = false
    }
    
    override func loadView() {
        super.loadView()
        self.view.setFrameSize(NSSize(width: 480, height: 300))
    }
}
```

Note:

-   if you want to change the view size, please use `override func loadView()`
-   use `addChild(Controller)` to add different view controller
-   You can define `splitView.dividerStyle`, `splitView.isVertical` properties.

## 2. get split parent view controller in child controller

```swift
func tableViewSelectionDidChange(_ notification: Notification) {
    guard let splitVC = self.parent as? SplitViewController else { return }
    
    if let rightViewVC = splitVC.children[1] as? RightViewController {
        rightViewVC.setupImage(name: self.photos[self.tableView!.selectedRow])
    }
}
```

Note:

-   You can use `self.parent` in your child controller to get the parent split controller
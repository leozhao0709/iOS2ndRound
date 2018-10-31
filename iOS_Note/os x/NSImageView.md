# NSImageView

## 1. usage

```swift
import Cocoa
import SnapKit

class RightViewController: NSViewController {
    
    weak var imageView: NSImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let imageView = NSImageView()
        self.view.addSubview(imageView)
        self.imageView = imageView
        
        imageView.setContentCompressionResistancePriority(NSLayoutConstraint.Priority.init(1), for: NSLayoutConstraint.Orientation.horizontal)
        imageView.setContentCompressionResistancePriority(NSLayoutConstraint.Priority.init(1), for: NSLayoutConstraint.Orientation.vertical)
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    override func loadView() {
        self.view = NSView()
        self.view.setFrameSize(NSSize(width: 380, height: 300))
    }
    
    func setupImage(name: String) {
        self.imageView?.image = NSImage(named: name)
    }
}
```

Note:

-   It's almost same with `UIImage` in iOS
-   You need set up the layout `ContentCompressionResistancePriority` or `ContentHugging` when image is too big or too small. `ContentCompressionResistancePriority` is how hard will I resist **being made smaller then my content**. `contentHugging` is how hard will I resist **being made bigger then my content**.
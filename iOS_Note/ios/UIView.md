# Customize UIView

## 1. load view

Load view will be used to **create View**, we can create ourselves' view here to reduce memory use as if we rewirte this method, the default view won't be create. (Note: don't call super if we create customerized view)

This load view will be called **before** `viewDidLoad()`.

```swift
override func loadView() {
}
```

## 2. setup UI

When we want to create an custom UI, here's some tips.

* **do not** setup UI **frame** in **init** method as in this step, we can't get any UI frame. It's always width=0 and height=0.
* Setup UI frame in **layoutSubviews**, in this step, you can get all the frame for each UI.
* both **init(frame: CGRect)** and **init()** will call `init(frame: CGRect)`, so we can only rewrite `init(frame: CGRect)`

```swift
import UIKit

class testView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }

    /**
    Just add UI, No frame need here
    */
    func setupUI() {
        // initial UI, but do not set frame as in this step, you can't get frame
    }

    /**
    init different UI frame here
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        // setup each UI frame here
    }
}
```

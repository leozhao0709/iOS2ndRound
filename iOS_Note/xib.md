# xib tips

## 1. xib create

```swift
static func loadPlayerToolBarView() -> PlayerToolBarView {
        return Bundle.main.loadNibNamed("PlayerToolBar", owner: nil, options: nil).first as! PlayerToolBarView
    }
```

Note:

* `Bundle.main.loadNibNamed` function will return an **array** as there maybe multiple views in one xib file. But in reality, we always just create one view in each xib.

* If you are **not** using **autolayout**, then it's better to do **not** change its **frame width and frame height**.

* don't use `init(frame: CGRect)` to initial xib file. It won't work. We can create a static method to create xib.

## 2. change the xib initial status (awakeFromNib)

If we want to change the initial value of XIB UI, we should change it in the method `awakeFromNib()`

```swift
    override func awakeFromNib() {

    }
```
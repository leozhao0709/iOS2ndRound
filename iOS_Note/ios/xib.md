# xib tips

## 1. xib static create

```swift

static func loadPlayerToolBarView() -> PlayerToolBarView {
    let playerToolBarView = Bundle.main.loadNibNamed("PlayerToolBar", owner: nil, options: nil).last as! PlayerToolBarView

    return playerToolBarView
}
```

Note:

* `Bundle.main.loadNibNamed` function will return an **array** as there maybe multiple views in one xib file. But in reality, we always just create one view in each xib.

* If you are **not** using **autolayout**, then it's better to do **not** change its **frame width and frame height**.

* don't use `init(frame: CGRect)` to initial xib file. It won't work. We can create a static method to return xib.

## 2. xib init create

```swift

private weak var contentView: WheelView?

override init(frame: CGRect) {
    super.init(frame: frame)
    let wheelView = Bundle.main.loadNibNamed(String(describing: WheelView.self), owner: nil, options: nil)?.last as! WheelView
    self.bounds = wheelView.bounds
    self.contentView = wheelView
    self.addSubview(wheelView)
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
}
```

Note:

* This initial will need an **extra contenView**. We can only add the xib to it's subview. **So I don't prefer this initial step.**

* We need to create xib in `override init(frame: CGRect)`

* In `override init(frame: CGRect)`, we can only **add xib in its subview**. But in this method, **default view frame is (0.0, 0.0, 0.0, 0.0), xib frame is (0.0, 0.0, xib.width, xib.height)**, so if we want to successfully add it, **we need set bounds before add xib to subview.**

## 3. change the xib initial status (awakeFromNib)

If we want to change the initial value of XIB UI, we should change it in the method `awakeFromNib()`

```swift
    override func awakeFromNib() {

    }
```
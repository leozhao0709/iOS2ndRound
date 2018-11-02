# NSStack View

## 0.Gotcha

Note:
-   For normal view, you can use `addSubview()` to add one view to another. But for stackView, you need to use `addArrangedSubview()`
-   For normal view, you can use `removeFromSuperview()` to remove subview. But for stackView, you need to use  `NSStackView.removeArrangedSubview(subview)` **as well as**  `subView.removeFromSuperview()`

## 1. usage

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    let rowStackView = NSStackView()
    rowStackView.orientation = .vertical
    rowStackView.distribution = .fillEqually
    self.view.addSubview(rowStackView)
    self.rowStackView = rowStackView
    
    rowStackView.snp.makeConstraints { (make) in
        make.top.equalToSuperview()
        make.bottom.equalToSuperview()
        make.left.equalToSuperview()
        make.right.equalToSuperview()
    }
    
    let colStackView = NSStackView(views: [self.makeWebView()])
    colStackView.distribution = .fillEqually
    rowStackView.addArrangedSubview(colStackView)
}
```

Note:

-   default NSStackView orientation is `horizental`
-   Please set up `distribution` for your stackView
-   please use `addArrangedSubview` to add a subView to your stackView
-   please use `arrangedSubviews` to loop your subviews
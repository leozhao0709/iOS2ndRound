# UISegmentedControl

## 1. UISegmentedControl initial

Here shows an example of how to use UISegmentedControl

```swift
let segment = UISegmentedControl(items: ["123", "234", "345", "567"])
segment.selectedSegmentIndex = 0;
segment.center = CGPoint(x: self.view.center.x, y: 200)
self.view.addSubview(segment)
```

## 2. Add event for UISegmentedControl

```swift
segment.addTarget(self, action: #selector(self.segmentClick(segement:)), for: .valueChanged )
```

Note: we need wirte an objc method `self.segmentClick(segement:)`.
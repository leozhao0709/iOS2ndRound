# Frame related

## 1. Using layer property to redefine the position

```swift
let btn = UIButton()
btn.bounds = CGRect(x: 0, y: 0, width: 68, height: 143)
btn.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
btn.layer.position = self.center

btn.transform = CGAffineTransform(rotationAngle: angle/180 * CGFloat.pi)
angle += 30
self.imageView.addSubview(btn)
```

Note:

- We can use layer `anchorPoint` to redefine the anchorPoint, Note anchorPoint value is in range [0, 1]. The defalut layer anchorPoint is (0.5, 0.5)

- After we setup the anchorPoint, we can use layer `position` property to redefine the position.

## 2. Difference for Frame and Bounds

Frame变化是从左上角向外延伸, bounds的变化是从中心向四周延伸. **如果要用center定位, 先确定center, 然后一定要用bounds.size, 不要用frame.size取确定view的size**
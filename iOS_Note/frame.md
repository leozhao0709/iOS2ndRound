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
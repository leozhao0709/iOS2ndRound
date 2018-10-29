# CGRect

## 1. point in a rect

We can use `CGRect.conatins(CGPoint)` to see if a point in a rect.

```swift
private func pointInBtn(point: CGPoint) -> UIButton? {
    for i in 0..<self.subviews.count {
        let btn = self.subviews[i] as! UIButton
        if btn.frame.contains(point) {
            return btn
        }
    }
    return nil
}
``
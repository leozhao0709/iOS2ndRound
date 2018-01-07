# Transform properties

Note: All the following example is just add a small change each time to transform. **If we just want to transform once, we can use `CGAffineTransform(translationX: navWidth, y: 0)` instead**.

## 1. translate

```swift
UIView.animate(withDuration: 0.5) {
    self.transformView.transform  = self.transformView.transform.translatedBy(x: 0, y: -30)
}
```

## 2. rotate

```swift
UIView.animate(withDuration: 0.5) {
    self.transformView.transform = self.transformView.transform.rotated(by: CGFloat.pi * 0.5)
}
```

## 3. scale

```swift
UIView.animate(withDuration: 0.5, animations: {
    self.transformView.transform = self.transformView.transform.scaledBy(x: 0.8, y: 0.8)
}) { (finish) in
    if finish {
        UIView.animate(withDuration: 0.5, animations: {
            self.transformView.transform = self.transformView.transform.scaledBy(x: 2, y: 2)
        }, completion: { (finish) in
            if finish {
                UIView.animate(withDuration: 0.5, animations: {
                    self.transformView.transform = self.transformView.transform.scaledBy(x: 1/1.6, y: 1/1.6)
                })
            }
        })
    }
}
```
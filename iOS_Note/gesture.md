# Gesture

## 1. Tap Gesture

```swift
@IBOutlet weak var testView: UIView!

override func viewDidLoad() {
    super.viewDidLoad()

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(tapGesture:)))
    self.testView.addGestureRecognizer(tapGesture)
}

@objc
private func tap(tapGesture: UIGestureRecognizer) {
    let tapPoint = tapGesture.location(in: self.testView)
    if tapPoint.x < self.testView.bounds.width*0.5 {
        print("tap left")
    } else {
        print("tap right")
    }
}
```

## 2. Long Press Gesture

Note here, long press gesture had a property `minimumPressDuration`, after this duration, long press gesture `state` will change to begin. Default duration is 0.

```swift
@IBOutlet weak var testView: UIView!

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(longPressGesture:)))
    longPressGesture.minimumPressDuration = 3
    self.testView.addGestureRecognizer(longPressGesture)
}

@objc
private func longPress(longPressGesture: UILongPressGestureRecognizer) {
    if longPressGesture.state == .began {
        print("long press begin")
    } else if longPressGesture.state == .changed {
        print("long press changed")
    } else if longPressGesture.state == .ended {
        print("long press end")
    }
}
```

## 3. Swipe Gesture

Note: **Each** Swipe Gesture **only has 1 direction**. If we want to add several directions, we need create several swipe gesture. But note: if we want to do a swipe user interaction function, it's better to use **Pan Gesture**

```swift
@IBOutlet weak var testView: UIView!

override func viewDidLoad() {
    super.viewDidLoad()

    let swipeGesture1 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe(swipeGesture:)))
    self.testView.addGestureRecognizer(swipeGesture1)

    let swipeGesture2 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe(swipeGesture:)))
    swipeGesture2.direction = .left
    self.testView.addGestureRecognizer(swipeGesture2)
}

@objc
private func swipe(swipeGesture: UISwipeGestureRecognizer) {
    if swipeGesture.direction == .left {
        print("left swipe")
    } else if swipeGesture.direction == .right {
        print("right swipe")
    }
}
```

## 4. Pan Gesture(挪动手势)

Note: When we get the `panGesture.translation(in: self.testView)`, this value will accumulate each time, but we only need the changed value not the accumulate value, so we need to **set the Gesture translation point back to 0 each time**.

```swift
private func addPanGesture() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
    self.testView.addGestureRecognizer(panGesture)
}

@objc
private func pan(panGesture: UIPanGestureRecognizer) {
    let movedPoint = panGesture.translation(in: self.testView)
    self.testView.transform = self.testView.transform.translatedBy(x: movedPoint.x, y: movedPoint.y)
    panGesture.setTranslation(CGPoint.zero, in: self.testView)
}
```

## 5. Pinch Gesture(捏合手势)

Note: When we get the `pinchGesture.scale`, it's also an accumulate value, **we need set it back to 1 each time**.

```swift
private func addPinchGesture() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(pinchGesture:)))
    self.testView.addGestureRecognizer(pinchGesture)
}

@objc
private func pinch(pinchGesture: UIPinchGestureRecognizer) {
    let scale = pinchGesture.scale
    self.testView.transform = self.testView.transform.scaledBy(x: scale, y: scale)
    pinchGesture.scale = 1
}
```

## 6. Rotate Gesture

Note: When we get the `rotationGesture.rotation`, it's also an accumulate value, **we need set it back to 0 each time**.

```swift
private func addRotateGesture() {
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotate(rotationGesture:)))
    self.testView.addGestureRecognizer(rotateGesture)
}

@objc
private func rotate(rotationGesture: UIRotationGestureRecognizer) {
    let rotateDegree = rotationGesture.rotation
    self.testView.transform = self.testView.transform.rotated(by: rotateDegree)

    rotationGesture.rotation = 0
}
```

## 7. Allow multiple gesture at same time

This one we need to use `UIGestureRecognizerDelegate` to help us and imeplement delegate method `func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool`

```swift

@IBOutlet weak var testView: UIView!

override func viewDidLoad() {
    super.viewDidLoad()

    self.addPinchGesture()
    self.addRotateGesture()
}

private func addRotateGesture() {
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotate(rotationGesture:)))
    rotateGesture.delegate = self
    self.testView.addGestureRecognizer(rotateGesture)
}

private func addPinchGesture() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(pinchGesture:)))
    pinchGesture.delegate = self
    self.testView.addGestureRecognizer(pinchGesture)
}

func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
}
```

Note: Like in this example, we should set `pinchGesture` and `rotateGesture` delegate to self, and then implement `gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool` method.
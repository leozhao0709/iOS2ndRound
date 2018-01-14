# CAAnimation

## 1. Difference for CAAnimation and UIView Animation

- **CAAnimation can only apllied on CALayer**.
- CALayer anchor point is (0.5, 0.5), so default CAAnimiation is based on its center point.
- CAAnimation 仅仅是假象, it doesn't change the original frame of view. So if we need an animation and it needs interact with UIView, then do not use CAAnimation.
- UIView Animation can change the original frame of view.
- 当需要用户交互时, **不能使用**CAAnimation.
- 当需要转场动画时, **可以使用**CATransitionAnimation.

## 2. CAAnimation Key Path

```swift
transform.scale // just need a CGFloat value
transform.scale.x
transform.scale.y
transform.scale.z
transform.rotation
transform.rotation.x // just need a CGFloat value
transform.rotation.y
transform.rotation.z
transform.translation //need CGSize or CGPoint Value
transform.translation.x
transform.translation.y
transform.translation.z
position
position.x
position.y
opacity
margin
zPosition
backgroundColor
cornerRadius
borderWidth
bounds // need CGRect value
contents
contentsRect
cornerRadius
frame // need CGRect value
hidden
mask
masksToBounds
shadowColor
shadowOffset
shadowOpacity
shadowRadius
```

## 3. CABasic Animation

```swift
private func setCAAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.y"
    animation.toValue = 150
    animation.duration = 0.5
    animation.isRemovedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    animation.delegate = self

    self.animatedView.layer.anchorPoint = CGPoint(x: 0, y: 0)
    self.animatedView.layer.add(animation, forKey: "animationName")
}

func animationDidStart(_ anim: CAAnimation) {
    printLog(message: "animatedView before Animation: \(self.animatedView.frame)")
}

func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//    self.animatedView.layer.removeAnimation(forKey: "animationName")
    printLog(message: "animatedView after Animation: \(self.animatedView.frame)")
}
```

Note:

- We can set `keyPath` and `toValue` or `byValue` to set the animation.

- If we want to keep the last state of animation, we need to set `isRemovedOnCompletion` and `fillMode`.

- We can set animation delegate to inspect the animation start and animation stop.

- CAAnimation can only add to layer.

- We can use `animation.repeatCount` to set animation repeat count.

- We can also use `animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)` to set the timing function. There are 5 timing function:
  - `kCAMediaTimingFunctionLinear`
  - `kCAMediaTimingFunctionEaseIn`
  - `kCAMediaTimingFunctionEaseOut`
  - `kCAMediaTimingFunctionEaseInEaseOut`
  - `kCAMediaTimingFunctionDefault`

## 4. CAKeyframe animation

```swift
private func setKeyFrameAnimation() {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position"

    let value1 = CGRect(x: 0, y: 0, width: 100, height: 100)
    let value2 = CGRect(x: 200, y: 0, width: 100, height: 100)
    let value3 = CGRect(x: 200, y: 300, width: 100, height: 100)
    let value4 = CGRect(x: 0, y: 300, width: 100, height: 100)

    animation.values = [value1, value2, value3, value4, value1]

    animation.isRemovedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    animation.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.duration = 3

//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 200, height: 300))
    animation.path = path.cgPath

    self.animatedView.layer.anchorPoint = CGPoint(x: 0, y: 0)
    self.animatedView.layer.add(animation, forKey: nil)
}
```

Note:

- KeyFrame animation can have a set of value change. `animation.values = [value1, value2, value3, value4, value1]`

- keyFrame animation can also set `animation.path` using UIBezierPath. Then animation will animated along with the path. **If both values and path were set, then only path will take effect. Path has high priority.**

- If we want to keep the last state of animation, we need to set `isRemovedOnCompletion` and `fillMode`.

- We can use `animation.repeatCount` to set animation repeat count.

- We can also use `animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)` to set the timing function. There are 5 timing function:
  - `kCAMediaTimingFunctionLinear`
  - `kCAMediaTimingFunctionEaseIn`
  - `kCAMediaTimingFunctionEaseOut`
  - `kCAMediaTimingFunctionEaseInEaseOut`
  - `kCAMediaTimingFunctionDefault`

## 5. CATransition

```swift
private func animation() {
    self.currentIndex += 1

    if self.currentIndex >= self.imageArr.count {
        self.currentIndex = 0
    }

    self.imageView.image = self.imageArr[self.currentIndex]

    let animation = CATransition()
    animation.duration = 1
    animation.type = "pageCurl"
    animation.subtype = "fromTop"

    animation.startProgress = 0.5
    animation.endProgress = 1

    self.imageView.layer.add(animation, forKey: nil)
}
```

Note:

- We can use `CATransition()` to do a transition animation.

- We can set up a different **type** for transition animation. Here are some of the type value:
  - `fade`
  - `moveIn`
  - `push`
  - `reveal`
  - `pageCurl`  向上翻一页
  - `pageUnCurl`  向下翻一页
  - `rippleEffect`  滴水效果
  - `suckEffect`  收缩效果，如一块布被抽走
  - `cube`  立方体效果
  - `oglFlip` 上下左右翻转效果
  - `rotate`  旋转效果
  - `cameraIrisHollowClose` 相机镜头关上效果(不支持过渡方向)
  - `cameraIrisHollowOpen` 相机镜头打开效果(不支持过渡方向)

- We can also set up **subtype** to set up the direction of an animation. Here's the type:
  - `fromLeft`
  - `fromRight`
  - `fromTop`
  - `fromBottom`

- When the type is **rotate**, we can set the following **substype**:
  - `90cw` 逆时针旋转 90°
  - `90ccw` 顺时针旋转 90°
  - `180cw` 逆时针旋转 180°
  - `180ccw`  顺时针旋转 180°

- We can also set up `animation.startProgress` and `animation.endProgress`. The value for this properties are [0, 1]. It can set the start position and end position of animation.
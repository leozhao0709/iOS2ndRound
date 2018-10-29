# UIImageView

## 1. load animation image

Note: this func had bugs for start a new animation while another animation is running.

```swift
func loadAnimation(animationsImages:inout [UIImage]?, repeatCount: Int, duration: TimeInterval, isStand: Bool) {

    var animationsImages = animationsImages
    self.imageView.animationImages = animationsImages
    self.imageView.animationDuration = duration
    self.imageView.animationRepeatCount = repeatCount

    self.imageView.startAnimating()

    animationsImages = nil
}
```

## 2. **important** difference between `UIImage(named: imageName)` and `UIImage(contentsOfFile: imagePath)`

`UIImage(named: imageName)` will store cache and if we set the original image to nil, it won't release the memory. **So we always just use this call for those images that always shows to user which means the images in Assets**.

`UIImage(contentsOfFile: imagePath)` won't store cache, so we can set the image to nil to release the memory. **We always create a image folder group for this situation.** And this func always work with `let imagePath = Bundle.main.path(forResource: imageName, ofType: "png")`

Note: when set image to nil, please also set the imageView image to nil. For example: `imageView.animationImages = nil`
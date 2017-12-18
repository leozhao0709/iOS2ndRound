# UIImageView

1. load animation image
  ```swift {.line-numbers}
  func animation(animationsImages:[UIImage], repeatCount: Int, duration: TimeInterval, isStand: Bool) {

        self.imageView.animationImages = animationsImages
        self.imageView.animationDuration = duration
        self.imageView.animationRepeatCount = repeatCount
        self.imageView.startAnimating()
    }
  ```
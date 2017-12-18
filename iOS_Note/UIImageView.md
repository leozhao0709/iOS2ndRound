# UIImageView

1. load animation image
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
2. difference between `UIImage(named: imageName)` and `UIImage(contentsOfFile: imagePath)`

    `UIImage(named: imageName)` will store cache and if we set the original image to nil, it won't release the memory.
    `UIImage(contentsOfFile: imagePath)` won't store cache, so we can set the image to nil to release the memory.

    Note: when set image to nil, please also set the imageView image to nil. For example: `imageView.animationImages = nil`
# UIButton

## 1. Customize title and imageView for Button

We need to **create ourself button class**, then We have 2 ways to resize the Button imageView and title position.

1. rewrite `titleRect(forContentRect contentRect: CGRect) -> CGRect` and `imageRect(forContentRect contentRect: CGRect) -> CGRect`

    ```swift
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
          return CGRect(x: 0, y: 0, width: 100, height: 70)
      }

      override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
          return CGRect(x: 100, y: 0, width: 70, height: 70)
      }
    ```

2. We can also do it within `layoutSubviews()`, this will be the one we always use.

    ```swift
    override func layoutSubviews() {
          super.layoutSubviews()
          self.imageView?.frame = CGRect(x: 100, y: 0, width: 70, height: 70)
          self.titleLabel?.frame = CGRect(x: 0, y: 0, width: 100, height: 70)
    }
    ```

## 2. Setup padding for UIButton

We can use the following 3 method to set up button padding.

```swift
self.contentEdgeInsets = UIEdgeInsetsMake()
self.imageEdgeInsets = UIEdgeInsetsMake()
self.titleEdgeInsets = UIEdgeInsetsMake()
```

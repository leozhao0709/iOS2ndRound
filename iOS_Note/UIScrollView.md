# UIScrollView

## 1. contentSize

if we want to scroll the scroll view, then we **must** set up the content size and the content size must be **larger** than original scroll view.

```swift
let scrollView = UIScrollView(frame: CGRect(x: 37, y: 98, width: 300, height: 200))
      scrollView.backgroundColor = UIColor.orange
      self.view.addSubview(scrollView)
      scrollView.contentSize = CGSize(width: 350, height: 250)
```

## 2. some attributes

```swift
// 弹簧效果
scrollView.bounces = true

// no matter set up content size or not, always show bounce
scrollView.alwaysBounceHorizontal = true
scrollView.alwaysBounceVertical = false

scrollView.showsHorizontalScrollIndicator = true
scrollView.showsVerticalScrollIndicator = false
```

## 3. contentOffset

Content offset is the offset between content and scroll view window.

```swift
scrollView.contentOffset = CGPoint(x: 50, y: 50)
```

This content offset means the content scroll to left 50 and scroll to bottom 50. **when offset number increase, it means scroll to left (content move to left) and scroll to bottom (content move to bottom)**

The offset X is always calculated by the **scroll view frame X - content frame X**. Same as offset Y.

## 4. contentInset

Content inset is the content padding. It will add extra space for content. But for the calculating **offset**, it **didn't change**. The offset X is still calculated by the **scroll view frame X - content frame X**. Same as offset Y.

**We always use this value when you want to have a negative offset**. If you don't set this value, but you have a negative offset, then when user scroll the scroll view, the offset will immediately jump back to 0. While if you set this value, the offset will not jump back to 0.

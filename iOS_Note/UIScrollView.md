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

// paging
self.scrollView.isPagingEnabled = true
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

## 5. delegate

Here just shows some common delegate for UIscrollView

```swift
func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        NSLog("scroll view did scroll")
}

func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
      NSLog("scroll view will begin dragging")
}

func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      NSLog("scroll view will end dragging")
}

func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      if !decelerate {
      NSLog("User stop scroll and scroll view stop scroll")
      } else {
      NSLog("User stop scroll, but scroll view is still scrolling")
      }
}

func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      NSLog("scroll view did end decelerating, scroll view stop scroll")
}
```

Note:

* If we want to detect the scroll view stop scroll, we need to implement it in both `scrollViewDidEndDragging` and `scrollViewDidEndDecelerating`.

## 6. zoom an image using scroll view

We can use scroll view to do an image zoom in zoom out. We just need to implement `viewForZooming` delegate and add `minimumZoomScale` and `maximumZoomScale` to scroll view.

```swift
override func viewDidLoad() {
      let imageView = UIImageView(image: #imageLiteral(resourceName: "1"))
      self.imageView = imageView
      scrollView.addSubview(imageView)

      scrollView.contentSize = CGSize(width: imageView.frame.width, height: imageView.frame.height)

      scrollView.delegate = self

      scrollView.minimumZoomScale = 0.5
      scrollView.maximumZoomScale = 2.0
}

func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return self.imageView
}
```

## 7. scroll view paging

* we can setup `scrollView.isPagingEnabled` to open the paging feature. And this feature always works together with `UIPageControl`. Please **do not** add UIPageControl to scroll view. You should add it to UIView.

* Note for UIPageControl, we can only change the image for UIPageControl by using **KVC**

  ```swift
  private func setUpPageControl() {
      self.pageCtrol.numberOfPages = imageCount
      self.pageCtrol.hidesForSinglePage = true
      self.pageCtrol.isUserInteractionEnabled = false

      // we can only use KVC to change page control image
      self.pageCtrol.setValue(UIImage(named: "current")  , forKeyPath: "_currentPageImage")
      self.pageCtrol.setValue(UIImage(named: "other"), forKeyPath: "_pageImage")
  }

  // scrollView delegate
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentPage = (self.scrollView.contentOffset.x / self.scrollView.frame.width).rounded()
        self.pageCtrol.currentPage = Int(currentPage)
  }
  ```

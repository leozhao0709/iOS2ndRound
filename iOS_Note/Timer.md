# Timer

Timer is used as a task scheduler in iOS.

## 1. Timer

```swift
weak var timer: Timer?

private func initialTimer() {
    self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.setupTimer(timer:)), userInfo: "timertimer", repeats: true)

    let mainLoop = RunLoop.main
    mainLoop.add(self.timer!, forMode: RunLoopMode.commonModes)
}

@objc private func setupTimer(timer: Timer) {
//    NSLog(timer.userInfo as! String)
    var nextPage = self.pageCtrol.currentPage + 1

    if nextPage == imageCount {
        nextPage = 0
    }
    self.scrollView.setContentOffset(CGPoint(x: CGFloat(nextPage) * self.scrollView.frame.width, y: 0) , animated: true)
    self.pageCtrol.currentPage = nextPage
}
```

Note:

* We always initial a timer with **weak**. As if we schedule the timer, this timer will immediately added to Main.RunLoop by default. So we just need a weak reference for it.

* We are using `Timer.scheduledTimer` to schedule a task. Note `userInfo`, we can pass some message here and we can traverse these info in selector.

* `MainLoop` is really important here. **The timer is added for default Mode if we don't change the mode in Main Loop. In this example, we change mode to commonModes. Default Mode is just add timer to Main thread, but Main thread contains all the UI related things. If user interact with iOS, then main thread will just works for user interact and ignore the timer. So we need change it to common mode here.**

* Using `Timer`, we can set up the time we want to schedule.

## 2. CADisplayLink

```swift
lazy var displayLink: CADisplayLink? = {
    print("displayLink-----")
    return CADisplayLink(target: self, selector: #selector(self.changeY))
}()

override func awakeFromNib() {
    self.displayLink?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
}

deinit {
    self.displayLink?.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
}
```

Note:

* We always initial a CADisplayLink with **lazy**. And **do not** use `weak` for CADisplayLink.

* **We need to remove the displayLink from main loop when we don't need it.**

* CADisplayLink refresh time is same with the frame number of Device(same with view `setNeedsDisplay()` function). So **we always use CADisplayLink for quick task. But if we need to call a task at a specific time, we need to use Timer instead**.
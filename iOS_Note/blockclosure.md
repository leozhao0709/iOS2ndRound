# Swift Colsure

## 1. Closure

- Closure should **not** use **weak**.

## 2. weak closure(block)

If we want use `self` in a closure, in order to avoid circular reference, we should use a **weak self** in closure. Here's the example how to use weak self in a closure.

```swift
    httpTool.loadData {[weak self] () -> () in
    print("加载数据完成,更新界面:", NSThread.currentThread())
    self!.view.backgroundColor = UIColor.redColor()
    }
```
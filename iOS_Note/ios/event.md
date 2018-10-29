# iOS Event

## 1. Base Event

iOS event is bubbling event transfer. So when one point was touched, then the event is transferred from UIApplication -> UIWindow -> parentView -> view.

## 2. `override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?`

In this function, point is the event touch point.

We can use this function to intercept the default system action. If we want to pass the event to its next receiver(or get a response from the top view), then we just need to write the `super.hitTest(point, with: event)` in this function as default. If we don't want to pass the event, we can just simply return a nil.

Using this function, we can also just pass the event when user tap some part of the view if we want. Then for the other part we don't want to interact, we can just return a `nil`.

## 3. `override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)`

**In this function, if we add `super.touchesBegan(touches, with: event)`, then this will pass the touch to its parents view.**

Note:

- **UIButton will not work in this, but UIView will work.**
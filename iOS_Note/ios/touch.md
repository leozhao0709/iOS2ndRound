# Touch

## 1. the touch method we always use

```swift
class MoveView: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first

        let preLocation = touch?.previousLocation(in: self)
        let currLocation = touch?.location(in: self)

        self.transform = self.transform.translatedBy(x: currLocation!.x - preLocation!.x, y: currLocation!.y - preLocation!.y)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }
}
``
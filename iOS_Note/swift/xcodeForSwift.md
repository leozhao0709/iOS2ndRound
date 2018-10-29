# xcode for swift tips

## 1. Use `MARK:-` to mark the function that you want to quickly track. It's like `#pragma mark-` in objective-c

![MARK:-](../images/swift/mark1.png)

## 2. Use `///` to mark a variable or constant, then each time when you try to use that variable, you can get a hint

![///](../images/swift/mark2.png)

## 3. Setup file prefix

![prefix](../images/swift/classPrefix.jpg)

## 4. Set up Http Security

We can add `App Transport Security Settings` to info.plist. Then we need to add `Allow Arbitrary Loads` to it to open the Http security.

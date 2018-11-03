# NSTextField

## 1. create a label

Note on mac os, there's no `UILabel` or `NSLabel`. We should use `NSTextField` to create a label.

```swift
label = NSTextField()
(label as! NSTextField).isBordered = false
(label as! NSTextField).drawsBackground = false
```

Note:

-   You can use `NSTextField.stringValue` to get or set the textField value
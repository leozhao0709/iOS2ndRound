# CALayer

## 1. UIView Layer

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.redView.layer.shadowColor = UIColor.blue.cgColor
    self.redView.layer.shadowOpacity = 1
    self.redView.layer.shadowOffset = CGSize(width: 10, height: 10)
    self.redView.layer.shadowRadius = 5

    self.redView.layer.cornerRadius = 5

    self.redView.layer.borderWidth = 2;
    self.redView.layer.borderColor = UIColor.green.cgColor
}
```

Note:

- `layer.shadowOpacity` default value is 0. If we don't set it, we can't see shadow.
- All **layer** related color need to **use cgcolor**.
- The border will show **in** the frame. It will occupied the content size.

## 2. UIImageView Layer

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.imageView.layer.cornerRadius = 10

    self.imageView.layer.borderColor = UIColor.green.cgColor
    self.imageView.layer.borderWidth = 2

    self.imageView.layer.masksToBounds = true
}
```

Note:

- For an UIImageView, the imageView can be set using layer, but the image is not directly add in its layer. So if we don't set `self.imageView.layer.masksToBounds` property, the **image** itself **won't be cut**. **Only UIImageView will be cut**.
- The image is not directly add to UIImageView, but add the layer contents property.

## 3. The difference for UIView and UILayer

- UIView inherit the UIResponder, which means it can deal with the user action. But UILayer did not.
- Another difference is UIView is only for iOS while UILayer can be used both in iOS and MacOS.
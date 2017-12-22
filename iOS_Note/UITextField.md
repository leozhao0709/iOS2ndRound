# UITextField

## 1. create UITextFiled

```swift
let textFiled = UITextField(frame: CGRect(x: self.view.center.x-60, y: 300, width: 120, height: 30))
textFiled.borderStyle = .roundedRect
self.view.addSubview(textFiled)
```

Note: We need to set `borderStyle`. The default value for border style is none. Then you may not see it.

## 2. delegate

```swift
func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("text filed begin editing")
}

func textFieldDidEndEditing(_ textField: UITextField){
    NSLog("text filed did end editing")
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

    NSLog("shouldChangeCharactersIn------\(string)")
    if string == "1" {
        return true
    }
    return false;
}
```

Note:

* this delegate is always using with `touchesBegan` to resignFirstResponder()

  ```swift
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  //        self.textFiled?.resignFirstResponder()
  //        self.textFiled?.endEditing(true)

          // Note this one is used much more as one screen may have many textFiled
          self.view.endEditing(true)
  }
  ```

* `textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool` is used to get the user input. the `string` in this delegate is what user input. The return value is intersting. If return true, then user input can show in textField, but if return false, the user input will not show in text filed. In previous example, only when user input 1, it will show in text filed.
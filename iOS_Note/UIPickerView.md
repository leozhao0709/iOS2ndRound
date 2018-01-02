# Picker View

## 1. data source

Picker view only has 2 data source

```swift
func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return self.flagArray.count
}
```

## 2. delegate

```swift
// returns width of column and height of row for each component.
@available(iOS 2.0, *)
optional public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat

@available(iOS 2.0, *)
optional public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat


// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse. 
// If you return back a different object, the old one will be released. the view will be centered in the row rect
@available(iOS 2.0, *)
optional public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?

@available(iOS 6.0, *)
optional public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? // attributed title is favored if both methods are implemented

@available(iOS 2.0, *)
optional public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView


@available(iOS 2.0, *)
optional public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
```

## 3. select row

We need to call the delegate to select a row.

```swift
self.pickerView(self.pickerView!, didSelectRow: (self.pickerView?.selectedRow(inComponent: 0))!, inComponent: 0)
```

## 4. date picker

Date picker is different with UIPicker View.

```swift
private func setupUI() {
    let datePicker = UIDatePicker()
    self.inputView = datePicker
    datePicker.datePickerMode = .date
    datePicker.addTarget(self, action: #selector(getter: self.datePicker), for: .valueChanged)

    self.datePicker = datePicker
}

@objc
private func dateSelect(datePicker: UIDatePicker) {
    let fmt = DateFormatter()
    fmt.dateFormat = "yyyy-MM-dd"

    self.text = fmt.string(from: datePicker.date)
}
```
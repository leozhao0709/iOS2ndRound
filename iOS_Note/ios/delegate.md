# Delegate

## 1. create protocol

```swift
protocol MyTableViewCellDelegate: NSObjectProtocol {
    func myTableViewCell(cell: MyTableViewCell, plusBtnClick plusBtn: UIButton)
    func myTableViewCell(cell: MyTableViewCell, minusBtnClick minusBtn: UIButton)
}
```

## 2. inner delegate

```swift
@IBAction func plusBtnClick(_ sender: UIButton) {
    if let delegate = self.delegate {
        delegate.myTableViewCell(cell: self, plusBtnClick: sender)
    }
}

@IBAction func minusBtnClick(_ sender: UIButton) {
    if let delegate = self.delegate {
        delegate.myTableViewCell(cell: self, minusBtnClick: sender)
    }
}
```

## 3. controller implement delegate

```swift
func myTableViewCell(cell: MyTableViewCell, plusBtnClick plusBtn: UIButton) {
    print("\(cell.indexPath!.row) plus btn click")
}

func myTableViewCell(cell: MyTableViewCell, minusBtnClick minusBtn: UIButton) {
    print("\(cell.indexPath!.row) minus btn click")
}
```
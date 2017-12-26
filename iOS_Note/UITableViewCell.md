# TableView Cell

## 1. We should rewrite `init(style: UITableViewCellStyle, reuseIdentifier: String?)` to create our customized cell. System will automartically call this method even we use register to create cell, this register will automatically call this rewrite method

```swift
 override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
   super.init(style: style, reuseIdentifier: reuseIdentifier)
 }
```

Note: `override init(frame: CGRect)` **won't** work for cell creation.

## 2. We should add all other UI to cell **contentView**

## 3. We should change the UI position in **LayoutSubviews**

## 4. If we want to use xib, then we need to regist xib cell

```swift
self.tableView.register( UINib(nibName: NSStringFromClass(TableViewCell.self), bundle: nil), forCellReuseIdentifier: carCellIdentifier)
```
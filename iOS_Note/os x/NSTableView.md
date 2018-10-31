# NSTableView

## 1. usage

```swift
weak var tableView: NSTableView?

override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do view setup here.
    let tableView = NSTableView()
    tableView.dataSource = self
    tableView.delegate = self
    self.tableView = tableView
    
    // add column
    let tableViewColumn = NSTableColumn()
    tableView.headerView = nil
    tableView.addTableColumn(tableViewColumn)
    
    // add scroll container
    let tableViewContainer = NSScrollView()
    tableViewContainer.documentView = tableView
    tableViewContainer.allowsMagnification = true
    tableViewContainer.hasVerticalScroller = true
    self.view.addSubview(tableViewContainer)
    
    // auto layout constrain
    tableViewContainer.snp.makeConstraints { (make) in
        make.left.equalToSuperview()
        make.right.equalToSuperview()
        make.top.equalToSuperview()
        make.bottom.equalToSuperview()
    }
}
```

Note:

-   `NSTableView` is a little different with `UITableView` in iOS.
-   You need to define `column` as `NSTableView` can have several different columns
-   You also need to set up the **scroll container**, and add your table view to scroll container. Not like the `UITableView`

## 2. datasource and delegate

```swift
func numberOfRows(in tableView: NSTableView) -> Int {
    return 100;
}

func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    var cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier), owner: self)

    if cellView == nil {
        cellView = NSTextField()
        cellView?.identifier = NSUserInterfaceItemIdentifier(rawValue: columnCellIdentifier)
    }
    
    (cellView as! NSTextField).stringValue = "Hello World! \(row)"
    
    return cellView
}

func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
    return 44
}
```

Note:

-   Use `func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?` to setup each ceil. **If you are not using xib, then you need to define your own `NSTextField` and `ImageView`**. But if you are using xib, you can use `cellView.textField` and `cellView.imageView`.
-   If you don't want the table view background color, you need set these: `tableView.backgroundColor = NSColor.clear` and `tableViewContainer.drawsBackground = false`.
-   If you have several column, you can use `if tableColumn?.title == "ColumnName"` to define different columns when set up the cell view.

## 3. xib code part example

```swift
// MARK:- TableView datasource and delegate
extension ViewController {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if tableColumn?.title == "Guess" {
            cellView.textField?.stringValue = "123"
        } else {
            cellView.textField?.stringValue = "456"
        }
        
        return cellView
    }
}
```
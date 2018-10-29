# tableView

## 1. properties

```swift
self.tableView.sectionIndexColor = UIColor.cyan
self.tableView.sectionIndexBackgroundColor = UIColor.orange
```

## 2. register cell

```swift
self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: carCellIdentifier)
```

## 3. dataSource

```swift
func numberOfSections(in tableView: UITableView) -> Int {
    return self.carGroups.count
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (self.carGroups[section].cars?.count)!
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: carCellIdentifier)

    if cell == nil {
        cell = UITableViewCell(style: .default, reuseIdentifier: carCellIdentifier)
    }

    let car = self.carGroups[indexPath.section].cars![indexPath.row]
    cell?.textLabel?.text = car.name
    cell?.imageView?.image = UIImage(named: car.icon!)

    return cell!
}

func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.carGroups[section].title
}

// Index search
func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    var titles:[String]? = []
    for carGroup in self.carGroups {
        titles?.append(carGroup.title!)
    }

    return titles
}
```

## 4. some datasource and delegate order

If we are trying to create an unequal height cell, note the order that system will call:

`cellForRowAt` > `heightForRowAt` > cell `layoutSubviews`

And when we create unequal cell, it need to contains the cell height calculate in **model**

## 5. reload/insert/remove data

* reload all data:

```swift
self.tableView.reloadData()
```

* reload some row or section. **Note**: This method only works for rows didn't change

```swift
let indexPathArray = [IndexPath(row: 0, section: 0)]
self.tableView.reloadRows(at: indexPathArray, with: .fade)
```

* insert one/some row(s):

```swift
let indexPathArray = [IndexPath(row: 0, section: 0)]
self.tableView.insertRows(at: indexPathArray, with: .fade)
```

* * remove one/some row(s):

```swift
let indexPathArray = [IndexPath(row: 0, section: 0)]
self.tableView.deleteRows(at: indexPathArray, with: .fade)
```

## 6. 左滑删除

For this, we only need to implement this delegate:

```swift
// 左滑删除
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    self.carGroups[indexPath.section].cars?.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .top)
}

// change左滑删除title
func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    return "删除"
}
```

## 7. 自定义左滑多个按钮

We should implement delegate: `func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?`

Note:

* this one will make the 左滑删除 失效
* `tableView.isEditing = false` will 复原cell到原位置

```swift
func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
let delete = UITableViewRowAction(style: .destructive, title: "删除") { (action, indexPath) in
    self.carGroups[indexPath.section].cars?.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .top)
}

let guanzhu = UITableViewRowAction(style: .normal, title: "关注") { (action, indexPath) in
    tableView.isEditing = false
}
// guanzhu.backgroundColor = UIColor.gray
return [delete, guanzhu]
}
```
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
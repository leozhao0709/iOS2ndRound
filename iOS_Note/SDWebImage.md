# SDWebImage

## 1. Basic usage

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: appCellIdentifier)

        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: appCellIdentifier)
        }

        let app = self.appsArray[indexPath.row]
        cell?.textLabel?.text = app.name
        cell?.detailTextLabel?.text = app.download

        cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"))

        return cell!
    }
```

Note: This `cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"))` is the basic sdwebimage use.

## 2. higher usage

```swift
cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"), options: SDWebImageOptions.retryFailed, progress: { (receivedSize, expectedSize) in
            let percentage: Float = Float(receivedSize/expectedSize)
            print(percentage)
        }, completed: { (image, error, cacheType, url) in
            print(cacheType.rawValue)
        })
```

Note: Using this function, we can get more information like **progress**, **cacheType** and you can set `SDWebImageOptions` to try different download.
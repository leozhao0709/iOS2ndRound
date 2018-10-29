# SDWebImage

## 1. Basic usage for imageView

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

## 2. more information for imageView

```swift
cell?.imageView?.sd_setImage(with: URL(string: app.icon!), placeholderImage: #imageLiteral(resourceName: "Snip20160221_306"), options: SDWebImageOptions.retryFailed, progress: { (receivedSize, expectedSize) in
            let percentage: Float = Float(receivedSize/expectedSize)
            print(percentage)
        }, completed: { (image, error, cacheType, url) in
            print(cacheType.rawValue)
        })
```

Note: Using this function, we can get more information like **progress**, **cacheType** and you can set `SDWebImageOptions` to try different download.

## 3. Download Image and no need for imageView

```swift
SDWebImageManager.shared().downloadImage(with: URL(string: app.icon!), options: SDWebImageOptions.retryFailed, progress: { (receivedSize, expectedSize) in

}) { (image, error, cacheType, finished, url) in

}
```

## 4. play gif

```swift
private func gif() {
    print(#function)
//        self.imageView.sd_setImage(with: URL(string: "http://static.piggif.com/gif/0/fa97f274fef884944a5c01f1265ccc58.gif"), placeholderImage: nil)

    let image = UIImage.sd_animatedGIFNamed("fa97f274fef884944a5c01f1265ccc58")
    self.imageView.image = image
}
```

Note:

- `sd_setImage` can work for gif.

- `sd_animatedGIFNamed` can be used to create gif UIImage. But note, **gif file can not be added to Assets.xcassets**, it can only add to the main bundle.

## 5. check Image type

```swift
private func imageType() {
    guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "fa97f274fef884944a5c01f1265ccc58.gif", ofType: nil)!)) else {
        print("invalid path")
        return
    }
    let type = NSData.sd_contentType(forImageData: imageData)!
    print(type)
}
```

Note: We need to use `Data` and `NSData.sd_contentType(forImageData: imageData)` to check image type.

## 6. Other properties

```swift
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //1.清空缓存
    //clear:直接删除缓存目录下面的文件,然后重新创建空的缓存文件
    //clean:清除过期缓存,计算当前缓存的大小,和设置的最大缓存数量比较,如果超出那么会继续删除(按照文件了创建的先后顺序)
    //过期时间:7天
    [[SDWebImageManager sharedManager].imageCache clearMemory];

    //2.取消当前所有的操作
    [[SDWebImageManager sharedManager] cancelAll];

    //3.最大并发数量 == 6
    //4.缓存文件的保存名称如何处理? 拿到图片的URL路径,对该路径进行MD5加密
    //5.该框架内部对内存警告的处理方式? 内部通过监听通知的方式请你缓存
    //6.该框架进行缓存处理的方式:可变字典--->NSCache
    //7.如何判断图片的类型: 在判断图片类型的时候，只匹配第一个字节
    //8.队列中任务的处理方式:FIFO
    //9.如何下载图片的? 发送网络请求下载图片,NSURLConnection
    //10.请求超时的时间 15秒

}
```

# Collection View

## 1. Add Collection View

```swift
private func setUpCollectionView() {
    let flowLayout = UICollectionViewFlowLayout()

    flowLayout.itemSize = CGSize(width: 100, height: 100)
    flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 10, bottom: 10, right: 10)
    flowLayout.minimumLineSpacing = 20

    let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
    collectionView.backgroundColor = UIColor.white

    collectionView.dataSource = self
    collectionView.delegate = self
    self.collectionView = collectionView
    self.view.addSubview(collectionView)

    collectionView.register(AppCell.self, forCellWithReuseIdentifier: cellIdentifier)
}
```

Note:

- We need **use layout to initial** the UICollectionView.
- UICollectionView default background Color is **black**.
- We can s**etup many properties in layout** intead of collectionView itself.

## 2. dataSource

```swift
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.appArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppCell

    cell.app = self.appArray[indexPath.item]
    return cell
}
```

## 3. customer cell

```swift
class AppCell: UICollectionViewCell {

  weak var label: UILabel?
  weak var imageView: UIImageView?

  var app: AppModel? {
      didSet {
          self.label?.text = self.app?.name
          self.imageView?.image = UIImage(named: (self.app?.icon)!)
      }
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      //        fatalError("init(coder:) has not been implemented")
  }

  override init(frame: CGRect) {
      super.init(frame: frame)

      let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height-20))

      let label = UILabel(frame: CGRect(x: 0, y: imageView.frame.maxY, width: self.frame.width, height: 20))
      label.textAlignment = .center
      self.contentView.addSubview(imageView)
      self.contentView.addSubview(label)

      self.imageView = imageView
      self.label = label
  }
}
```

Note:

- We should use `override init(frame: CGRect)` to initial collectionViewCell if we want to use code to do it.
- We can also use xib to create cell. But make sure we are using `collectionView.register(UINib(nibName: String(describing: AppCell.self), bundle: nil), forCellWithReuseIdentifier: cellIdentifier)` to register cell.
- If we are using xib, please know the cell size will still be decided by `flowLayout.itemSize`.
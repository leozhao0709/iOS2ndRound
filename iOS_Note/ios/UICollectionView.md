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
- We can **setup many properties in layout** intead of collectionView itself.

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

## 4. customer layout

```swift
class PhotoFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        self.scrollDirection = .horizontal
        let collectionViewSize = self.collectionView?.frame.size

        let itemWidth = (collectionViewSize?.height)! * 0.6
        let itemHeight = (collectionViewSize?.height)! * 0.8

        self.itemSize = CGSize(width: itemWidth, height: itemHeight)

        let margin = (collectionViewSize?.width)!/2 - itemWidth/2

        self.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
    }

    /**
     - parameter rect: 可见范围的rect

     - returns: [UICollectionViewLayoutAttributes]: 可见范围cell的属性, 该属性是相对于整个content的属性, 所以x, y是相对于整个content size的
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        let superAttributes = super.layoutAttributesForElements(in: rect)

        //计算出屏幕的中心点， 中心点必须加上collectionView的偏移量.x
        let screenCenter = (self.collectionView?.contentOffset.x)! + (self.collectionView?.frame.size.width)!/2

        var attributesCopyArray:[UICollectionViewLayoutAttributes] = []
        for itemAttributes in superAttributes! {
            let deltaMargin = abs(screenCenter - itemAttributes.center.x)

            let scaleDelta = 1.1 - deltaMargin / ((self.collectionView?.frame.size.width)!/2 + itemAttributes.size.width)

            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            itemAttributesCopy.transform = CGAffineTransform(scaleX: scaleDelta, y: scaleDelta)
            attributesCopyArray.append(itemAttributesCopy)
        }

        return attributesCopyArray
    }

    //当content变化时, 是否重绘可见范围
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    /**
     - parameter proposedContentOffset: 最终停留的位置, 相对于整个content, 和super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) 相同
     - parameter velocity:              力度，速度

     - returns: targetContentOffset: 最终停留的位置(进行干预后停留的位置), 相对于整个content

     self.collectionView?.contentOffset在这个function中指的是手指离开屏幕时停留的位置
     */
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        //1.取出屏幕的中心点
        let screenCenter = proposedContentOffset.x + (self.collectionView?.frame.width)!/2

        //2. 取出可见范围内的cell
        var visibleRect = CGRect.zero
        visibleRect.size = (self.collectionView?.frame.size)!
        visibleRect.origin = proposedContentOffset

        //用super避免重复调用计算比率
        let visibleArray = super.layoutAttributesForElements(in: visibleRect)

        var minMargin = CGFloat.greatestFiniteMagnitude
        for attributes in visibleArray! {
            let deltaMargin = (attributes.center.x - screenCenter)

            if abs(minMargin) > abs(deltaMargin) {
                minMargin = deltaMargin
            }
        }

        return CGPoint(x: proposedContentOffset.x + minMargin, y: proposedContentOffset.y)
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        <#code#>
    }
}
```

Note:

- We should do all UI size related thing in `override func prepare()` function.
- `override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?` this one only return the **visibale rect** item attributes.
- `override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool` we should always rewrite this function.
- `override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint` This function will be used if we want to change the default content stay position.
- `override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?` we can use this function to rewirte each cell attributes according to indexPath.
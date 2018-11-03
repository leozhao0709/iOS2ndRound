# NSCollectionView

## 1. usage

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    
    self.collectionView.register(PhotoCell.self, forItemWithIdentifier: photoCellIdentifier)
}

// dataSource
func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
}

func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    let item = collectionView.makeItem(withIdentifier: photoCellIdentifier, for: indexPath)
    
    guard let collectionViewItem = item as? PhotoCell else { return item }
    
    collectionViewItem.view.wantsLayer = true
    collectionViewItem.imageView?.image = NSImage(contentsOf: self.photos[indexPath.item])
    
    return collectionViewItem
}
```

Note:

-   This is almost same with UICollectionView. Please check iOS/UICollectionView.
-   Note if you are not using xib or storyboard, be careful with the layout. You need a layout to initial CollectionView.
-   You should define each item size with `flowLayout.itemSize` no matter using storyboard or xib or code.
-   If we are using xib to define the cell, the cell size will still be decided by `flowLayout.itemSize`, not xib defined size.
-   If you are using code, you may need a scroll container.(not like UICollectionView)

## 2. customer cell

```swift
class PhotoCell: NSCollectionViewItem {

    private var selectedBorderWidth: CGFloat = 3
    private var selectedBorderColor = NSColor.blue.cgColor
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.view.layer?.borderWidth = selectedBorderWidth
                self.view.layer?.borderColor = selectedBorderColor
            } else {
                self.view.layer?.borderWidth = 0
            }
        }
    }
    
    override var highlightState: NSCollectionViewItem.HighlightState {
        didSet {
            if highlightState == .forSelection {
                self.view.layer?.borderWidth = selectedBorderWidth
                self.view.layer?.borderColor = selectedBorderColor
            }
            else if highlightState == .forDeselection {
                self.view.layer?.borderWidth = 0
            }
            // when release mouse, we should keep the correct border width
            else if highlightState == .none {
                if self.isSelected {
                    self.view.layer?.borderWidth = selectedBorderWidth
                } else {
                    self.view.layer?.borderWidth = 0
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
    } 
}
```

Note:

-   You can set the `isSelected` and `highlightState` for cell selection.
-   If you are using xib, the `NSCollectionViewItem` has a default imageView in source code. If you want to use it, you need to control drag `File's Owner` to your `image view` in xib file.
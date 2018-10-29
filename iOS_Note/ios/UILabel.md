# UILabel

## 1. UIlabel only has a small part of properties.

example:

```swift
  let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 175))
        label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "test string!!!test string!!!test string!!!test string!!!test string!!!test string!!!test string!!!"

        label.textColor = UIColor.white

        label.shadowColor = UIColor.black
        label.shadowOffset = CGSize(width: -2, height: 1)

        label.numberOfLines = 0

        /*
         case byWordWrapping // Wrap at word boundaries, default

         case byCharWrapping // Wrap at character boundaries

         case byClipping // Simply clip

         case byTruncatingHead // Truncate at head of line: "...wxyz"

         case byTruncatingTail // Truncate at tail of line: "abcd..."

         case byTruncatingMiddle // Truncate middle of line:  "ab...yz"
         */
        label.lineBreakMode = .byWordWrapping

        self.view.addSubview(label)
```

Note:

* `lineBreakMode` always works together with `numberOfLines`. For example, `byWordWrapping` and `byCharWrapping` should always work with `numberOfLines=0`. byWrapping, of course, need an automatically line change, then we can see it.
* `byTruncating...` should always work with `numberOfLines!=0`, only when it does not change line automatically, then we can see a trucate.

## 2. get width according to text font size (for one line)

```swift
let myString: String = "Some text is just here..."
let textArr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
let width = myString.size(withAttributes: textArr).width
```

## 3. get height according text (for multiple line)

```swift
let myString: String = "Some text is just here..."
let textArr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
// Max Float means no limitation for height
let textMaxSize = CGSize(width: maxMath, height: MAXFLOAT)
let textH = myString.boundingRect(textMaxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textArr, context: nil).height
```
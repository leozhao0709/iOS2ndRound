# plist

Note we can only use **NSArray** or **NSDictionary** to write or read.

## 1. read plist file content to an array or dict

```swift
let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
let arrayPath = documentPath.appendingPathComponent("data.plist")
let dictPath = documentPath.appendingPathComponent("dict.plist")

let array = NSArray(contentsOfFile: arrayPath)
let dict = NSDictionary(contentsOfFile: dictPath)

print(array!)
print(dict!)
```

```swift
lazy var photos: [String] = {
    let res = Bundle.main.path(forResource: "photos.plist", ofType: nil)
    
    let temp = NSArray(contentsOfFile: res!)
    return temp as! [String]
}()
```

## 2. write array or dictionary to plist

```swift
let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
let arrayPath = documentPath.appendingPathComponent("data.plist")

let array = NSArray(array: ["aaa", "bbbb"])

array.write(toFile: arrayPath, atomically: true)

let dictPath = documentPath.appendingPathComponent("dict.plist")

let dict = NSDictionary(dictionary: ["name": "Lei", "age": 10])
dict.write(toFile: dictPath, atomically: true)
```

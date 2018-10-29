# MJ_Extension

## 1. When use this extension in swift, we neeed add `@objcMembers` to model class

## 2. If there is a model inside a model, when can use this

```swift
lazy var carGroups:[CarsGroup] = {
  CarsGroup.mj_setupObjectClass(inArray: { () -> [AnyHashable : Any]? in
      return ["cars": Car.self]
  })
  return CarsGroup.mj_objectArray(withFilename: "cars.plist") as! [CarsGroup]
}()
```

## 3. If the nest model is really deep, we can also override function `mj_objectClassInArray` in each model class

```swift
import MJExtension
@objcMembers
class CarsGroup: NSObject {
    var title: String?
    var cars: [Car]?

    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["cars": Car.self]
    }
}
```

Then in controller, we just need use this"

```swift
    lazy var carGroups:[CarsGroup] = {
        return CarsGroup.mj_objectArray(withFilename: "cars.plist") as! [CarsGroup]
    }()
```
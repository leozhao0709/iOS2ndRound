# swift Singleton

## 1. singleton

```swift
class Person: NSObject {
    static var sharedPerson: Person = {
        let person = Person()
        return person
    }()

    private override init() {
    }
}
```
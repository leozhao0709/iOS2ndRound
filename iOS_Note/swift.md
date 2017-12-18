# swift tips

1. transfer reference to function

    Swift pass **value copy** to function parameter **by default**. But we can use `inout` keyword to pass a reference.

    example (not working):
    ```swift
      func swap(a: Int, b: Int) {
        var b = b
        var a = a
        let m = a
        a = b
        b = m
      }
      swap(a: a, b: b)
    ```

    example (working):
    ```swift
      func swap(a: inout Int, b: inout Int) {
          let m = a
          a = b
          b = m
      }
      swap(a: &a, b: &b)
    ```

2. Class constructor with a dictionary (KVC)

    Use `setValuesForKeysWithDictionary(dict)` to pass an dictionary to a class constructor.

    Note:
    * From swift4, we should add `@objcMembers` to class or add `@objc` to each class variable member, then we can use the `setValuesForKeys(dict)` method.

    * if we pass a dictionary that contains more than class members, then we should override `setValue(_ value: Any?, forUndefinedKey key: String)` function, otherwise, it will give an exception.

    example:
    ```swift
    @objcMembers
    class Person: NSObject {
        var name: String?
        var age: Int = 0

        init(dict: [String: Any]) {
            super.init()
            self.setValuesForKeys(dict)
        }

        override func setValue(_ value: Any?, forUndefinedKey key: String) {

        }
    }

    let dict:[String: Any] = ["name" : "why", "age" : 18, "height": "188cm"]
    let p = Person(dict: dict)
    ```

3. weak closure(block)

    If we want use `self` in a closure, in order to avoid circular reference, we should use a **weak self** in closure. Here's the example how to use weak self in a closure.

    ```swift
      httpTool.loadData {[weak self] () -> () in
        print("加载数据完成,更新界面:", NSThread.currentThread())
        self!.view.backgroundColor = UIColor.redColor()
      }
    ```
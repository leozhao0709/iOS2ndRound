# swift base key knowledge

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
    ```

    example (working):
    ```swift
      func swap(a: inout Int, b: inout Int) {
          let m = a
          a = b
          b = m
      }
    ```
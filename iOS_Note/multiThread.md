# MultiThread

## 1. Basic Thread

```swift
// 卖票例子
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let threadA = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
    let threadB = Thread(target: self, selector: #selector(self.sellTicket), object: nil)
    let threadC = Thread(target: self, selector: #selector(self.sellTicket), object: nil)

    threadA.name = "A"
    threadB.name = "B"
    threadC.name = "C"

    threadA.start()
    threadB.start()
    threadC.start()
}

@objc
private func sellTicket() {
    while true {
        objc_sync_enter(self)
        let count = self.totalCount
        if count > 0 {
            self.totalCount = count - 1;
            print("-----\(String(describing: Thread.current.name!))----left \(self.totalCount) tickets")
        } else {
            print("-----\(String(describing: Thread.current.name!))----all tickets were sold out")
//                break
            Thread.exit()
        }
        objc_sync_exit(self)
    }
}
```

Note:

- We can create a thread using `let threadA = Thread(target: self, selector: #selector(self.sellTicket), object: nil)`, but remember we need call `threadA.start()` to start the thread running.

- We can use `threadA.name = "A"` to set a thread name.

- We can use `objc_sync_enter(self)` and `objc_sync_exit(self)` to do a lock part for the code.

- We can also use `Thread.exit()` to exit a thread. But note, this is a class function.

- We can use `self.performSelector(onMainThread: #selector(self.setTicketsCountLabel(object:)), with: self, waitUntilDone: true)` to go back to main thread. But note, looks like the `with:` parameter **can only pass Object**, directly **pass an int will not work**.
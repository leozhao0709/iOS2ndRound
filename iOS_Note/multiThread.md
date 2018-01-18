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

## 2. GCD

```swift
private func asyncConcurrent() {
    print("start---")
    DispatchQueue.global().async {
        print("Download1.....\(Thread.current)")
    }
    DispatchQueue.global().async {
        print("Download2.....\(Thread.current)")
    }
    DispatchQueue.global().async {
        print("Download3.....\(Thread.current)")
    }
    print("end---")
}
```

Result:

![asyncConcurrent](images/gcd/asyncConcurrent.png)

```swift
private func asyncSearial() {
    print("start-------")
    DispatchQueue.main.async {
        print("Download1.....\(Thread.current)")
    }
    DispatchQueue.main.async {
        print("Download2.....\(Thread.current)")
    }
    DispatchQueue.main.async {
        print("Download3.....\(Thread.current)")
    }
    print("end-----")
}
```

Result:

![asyncMain](images/gcd/asyncMain.png)

```swift
private func syncConcurrent() {
    print("start---")
    DispatchQueue.global().sync {
        print("Download1.....\(Thread.current)")
    }
    DispatchQueue.global().sync {
        print("Download2.....\(Thread.current)")
    }
    DispatchQueue.global().sync {
        print("Download3.....\(Thread.current)")
    }
    print("end-----")
}
```

Result:

![syncConcurrent](images/gcd/syncConcurrent.png)

```swift
private func syncSearial() {
    print("start")
    print(Thread.current)
    let searialQueue = DispatchQueue(label: "queuename")
    searialQueue.sync {
        print("Download1.....\(Thread.current)")
    }
    searialQueue.sync {
        print("Download2.....\(Thread.current)")
    }
    searialQueue.sync {
        print("Download3.....\(Thread.current)")
    }
    print("end-----")

    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        print("1s late to run")
    }
}
```

Result:

![syncSearial](images/gcd/syncSerial.png)

Note:

- `async` has the ability to create a new thread. While `sync` doesn't have this ability.

- `async` and `concurrency` will create some new thread and a concurrency queue to run task. So the task running may not according to its order.

- `MainQueue` is a a serial queue. And when you are using MainQueue, the async will **not** work. It will still go as sync.

- **Searial MainQueue called by Main queue will give a dead lock, so your app will be stuck**.

- `async` and `serial` will go as the order. As the serial queue need to run task one by one. But note the original thread will still go. Check example above.

- ![gcd总结](images/gcd/gcd总结.png)

- We can use `DispatchQueue.main.asyncAfter` to do a delay running.

- `Dispatch once` is no longer work in swift. Use `lazy` instead.
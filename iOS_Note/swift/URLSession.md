# URLSession

## 0. trick

1.  Please use `dataTask.resume()` to start the network call.
2.  All the URLSession task is not in main thread

## 1. get

```swift
private func get() {
    let session = URLSession.shared
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in
        if err == nil {
            let res = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String: Any]]
            print("\(res[0]["title"]! as! String)")
        }
    }
    dataTask.resume()
}
```

Note:

-   You must use `dataTask.resume()` to start the network call.
-   please check error in your callback
-   Use `session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in {}` to create a get task

## 2. post

```swift
private func post() {
    let session = URLSession.shared
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]

    let post = Post(user_id: 12, id: nil, title: "haha", body:"I'm body")
    urlRequest.httpBody = try? JSONEncoder().encode(post)

    let dataTask = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
        let post = try? JSONDecoder().decode(Post.self, from: data!)
        print(post!)
    }
    
    dataTask.resume()
}
```

Note:

-   For a `post` request, you must use `URLRequest` and set up `httpMethod`, `allHTTPHeaderFields` and `httpBody` for the request
-   Remember the `dataTask.resume()` to start network call
# JSON in swift

## 1. json to swift dict/array

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

-   use `JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String: Any]]` to get a swift dict array or a dict in swift. data is `Data` object.
-   `JSONSerialization.ReadingOptions.allowFragments` is an always used option.
-   it may throw errors

## 2. swift dict/array to JSON

```swift
private func objToJSON() {
    let dict = ["id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "userId": 1] as [String : Any]
    if JSONSerialization.isValidJSONObject(dict) {
        let json = try! JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.sortedKeys)
        
        print(String(data: json, encoding: String.Encoding.utf8)!)
    } 
}
```

Note:

-   You can use `JSONSerialization.isValidJSONObject(dict)` to check if the object can be stringify.
-   You can use `let json = try! JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.sortedKeys)` to stringify a swift dict/array

## 3. JSON to object/struct in swift 4

First, you need to have a struct/class and inherit the `Codable`.

```swift
struct Post: Codable {
    var user_id: Int
    var id: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case user_id = "userId"
        case id
        case title
        case body
    }
}
```

Then you can encode or decode Json

```swift
private func get() {
    let session = URLSession.shared
        
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/5") else { return }
    let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in
        if err == nil {
            let post = try! JSONDecoder().decode(Post.self, from: data!)
            print(post)
        }
    }
    dataTask.resume()
}
```

```swift
private func objToJSON() {
    let post = Post(user_id: 12, id: 10, title: "haha", body:"I'm body")
    let json = try! JSONEncoder().encode(post) // this is a json object
    print(String(data: json, encoding: String.Encoding.utf8)!)
}
```

Note:

-   `typealias Codable = Decodable & Encodable`
-   use `let post = try! JSONDecoder().decode(Post.self, from: data!)` to decode a json object. If it's a json array, you can use `let posts = try! JSONDecoder().decode([Post].self, from: data!)`
-   use `let json = try! JSONEncoder().encode(post)` to encode a json object
-   You can redefine the json key with `enum CodingKeys: String, CodingKey`

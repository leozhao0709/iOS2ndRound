# Regular expression

## 1. Match usage

```swift
let regex = try! NSRegularExpression(pattern: "\\d{4}")
let matches = regex.matches(in: userGuess, range: NSRange(userGuess.startIndex..., in: userGuess)) // this will only give you the matches range, not the matches string result
print(matches.map {String(userGuess[Range($0.range, in: userGuess)!])}) // this will give you the matches string
```
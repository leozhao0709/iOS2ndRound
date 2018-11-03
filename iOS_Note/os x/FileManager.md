# FileManager

## 1. usage

```swift
class ViewController: NSViewController {
    var photos: [URL] = []
    
    lazy var photosDir: URL = {
        let fm = FileManager.default
        let documentDir = fm.urls(for:  .documentDirectory, in: .userDomainMask)[0]
        let saveDir = documentDir.appendingPathComponent("SlideMark")
        
        if !fm.fileExists(atPath: saveDir.path) {
            try? fm.createDirectory(at: saveDir, withIntermediateDirectories: true, attributes: nil)
        }
        
        return documentDir.appendingPathComponent("SlideMark")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let fm = FileManager.default
            let files = try fm.contentsOfDirectory(at: self.photosDir, includingPropertiesForKeys: nil)
            for file in files {
                if file.pathExtension == "jpg" || file.pathExtension == "png" {
                    self.photos.append(file)
                }
            }
        } catch {
            print("Set up error")
        }
    }
}
```

Note:

-   use `let documentDir = fm.urls(for:  .documentDirectory, in: .userDomainMask)[0]` to get document dir
-   When create or get contents, you need to use `try catch`
-   You may want to edit `.entitlements` and close `App Sandbox`, then it will store things to document dir, otherwise, it will use sandbox
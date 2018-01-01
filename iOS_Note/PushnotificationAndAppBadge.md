# Push Notification And App Icon Badge

## 1. register settings

If we want to use push notification and app icon badge, we must regist it first. We **always** register these code in `didFinishLaunchingWithOptions` in app delegate.

Note, we need to **import UserNotifications**

```swift
if #available(iOS 10.0, *) {
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
    guard error == nil else {
        return
    }

    if granted {
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    } else {
        // denied
    }
}
} else {
    // Fallback on earlier versions
    let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
    application.registerUserNotificationSettings(settings)
    application.registerForRemoteNotifications()
}
```

## 2. set app icon badge number

```swift
let app = UIApplication.shared
app.applicationIconBadgeNumber = 10
```


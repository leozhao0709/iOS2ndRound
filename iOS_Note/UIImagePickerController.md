# UIImagePickerController

## 1. create UIImagePicker Controller

```swift
@IBAction func getPhotos(_ sender: UIBarButtonItem) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .savedPhotosAlbum
    imagePickerController.delegate = self

    self.present(imagePickerController, animated: true, completion: nil)
}

func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
    self.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
}
```

Note:

- The delegate for UIImagePickerController needs to implements **both** `UIImagePickerControllerDelegate` and `UINavigationControllerDelegate`
- The `info` in `imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]` is something like this: `["UIImagePickerControllerImageURL": file:///Users/lzhao/Library/Developer/CoreSimulator/Devices/085B8CB0-3291-4FF9-87DF-AD5CF4244516/data/Containers/Data/Application/B0DBFFF0-EF72-4C5F-8A4B-3A4454A38608/tmp/8A79BB1B-AC6F-4D49-9797-681EC24AE8AC.jpeg, "UIImagePickerControllerMediaType": public.image, "UIImagePickerControllerReferenceURL": assets-library://asset/asset.JPG?id=99D53A1F-FEEF-40E1-8BB3-7DD55A43C8B7&ext=JPG, "UIImagePickerControllerOriginalImage": <UIImage: 0x60c0000aa680> size {1668, 2500} orientation 0 scale 1.000000]`
- We need to add key `Privacy - Photo Library Additions Usage Description` to plist file.
- From Xcode menu open: Product > Scheme > Edit Scheme > On your Environment Variables set OS_ACTIVITY_MODE in the value set disable to disable the env log.
## ZBSTools 
__Using Swift more conveniently, smoothly__

#### * ZBSImagePickerManager 
is encapsulation of UIImageUIImagePickerController ans UIImagePickerControllerDelegate.  
In Controller 
```
    ZBSImagePickerManager.shared.launchImagePickerIn(controller: self, sourceType: source) { (image) in
        weakSelf?.selectedImageView.image = image;
    }
```
> You must add NSCameraUsageDescription in info.plist if  you want to get image from camera;

#### * ZBSAlertController


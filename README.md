## ZBSTools 
__Using Swift more conveniently, smoothly__

#### * ZBSImagePickerManager 
is encapsulation of UIImageUIImagePickerController ans UIImagePickerControllerDelegate.  
You can get image from camera simply like this, 
```
ZBSImagePickerManager.shared.launchImagePickerIn(controller: viewController, sourceType: .camera) { (image) in
    //TODO:do something with image;
}
```
> You must add NSCameraUsageDescription in info.plist if  you want to get image from camera;

#### * ZBSAlertController  
subclass of UIAlertController, encapsulate some methods; 


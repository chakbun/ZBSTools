## ZBSTools 
__Using Swift more conveniently, smoothly__

#### ZBSImagePickerManager 
is encapsulation of UIImageUIImagePickerController ans UIImagePickerControllerDelegate.  
You can get image from camera simply like this, 
```
ZBSImagePickerManager.shared.launchImagePickerIn(controller: viewController, sourceType: .camera) { (image) in
    //TODO:do something with image;
}
```
> You must add NSCameraUsageDescription in info.plist if  you want to get image from camera;

#### ZBSAlertController  
subclass of UIAlertController, make less code to present A simple alert view;   
You can present A alert view in your controller like this, 
```
ZBSAlertController.simple2optionsAlertViewWith(name: "title", message: "message", yesButtonName: "Done", yesButtonAction: { (action) in
    //TODO:do something for Done action
}, noButtonName: "Cancel", noButtonAction: { (action) in
    //TODO:do something for Cancel action
}).presentedIn(self, animated: true) {
    //TODO:do something when alert view has presented
}
```

### [CocoaPods][cocoapods]
```
pod 'ZBSTools', '~> 0.0.2'
```


[cocoapods]: https://cocoapods.org/



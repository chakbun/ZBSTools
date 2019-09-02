//
//  ViewController.swift
//  ZBSToolsSample
//
//  Created by jaben on 2019/8/30.
//  Copyright © 2019 Jaben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var previewImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectImageButton(_ sender: Any) {
        
        weak var weakSelf = self
        
        func loadImageFrom(_ source: ZBSImagePickerSource) {
            
            ZBSAlertController.simple2optionsAlertViewWith(name: "title", message: "message", yesButtonName: "Done", yesButtonAction: { (action) in
                //Done action code
            }, noButtonName: "Cancel", noButtonAction: { (action) in
                //Cancel action code
            }).presentedIn(self, animated: true) {
                //present completed code
            }
            return
            
            ZBSImagePickerManager.shared.launchImagePickerIn(controller: weakSelf!, sourceType: source, didCompleted: { (image) in
                weakSelf?.previewImageView.image = image
            })
        }
        
        self.presentSimpleActionSheetWith(name: "Get image", message: "From source",
                                          buttons: ZBSButton(name: "Photo Library", action: { (action) in
                                            loadImageFrom(.photoLibrary)
                                          }, style: .destructive),
                                          
                                          ZBSButton(name: "Photo Albumn", action: { (action) in
                                            loadImageFrom(.savedPhotosAlbum)
                                          }, style: .default),
                                          
                                          ZBSButton(name: "Camera", action: { (action) in
                                            loadImageFrom(.camera)
                                          }, style: .default),
                                          
                                          ZBSButton(name: "Cancel", action: nil, style: .cancel)
        )
        
    }


}


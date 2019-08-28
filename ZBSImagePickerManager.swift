//
//  ZBSImagePickerManager.swift
//
//
//  Created by jaben on 2019/8/24.
//  Copyright © 2019 Jaben. All rights reserved.
//

import UIKit

typealias ZBSImagePickerSource = UIImagePickerController.SourceType
typealias ZBSImagePickerBlock = (UIImage?)->Void

class ZBSImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    static let shared: ZBSImagePickerManager = ZBSImagePickerManager()
    
    private var imageController: UIImagePickerController
    
    private var imagePickedBlock: ZBSImagePickerBlock?
    
    override init() {
        self.imageController = UIImagePickerController.init()
        super.init()
        self.imageController.delegate = self
        self.imageController.allowsEditing = false
    }
    
    // MARK: - Public
    public func supportType(source:ZBSImagePickerSource)->Bool {
        return UIImagePickerController.isSourceTypeAvailable(source)
    }
    
    public func launchImagePickerIn(controller: UIViewController, sourceType:ZBSImagePickerSource, didCompleted handler:@escaping ZBSImagePickerBlock)->Void {
        self.imageController.sourceType = sourceType
        if supportType(source: sourceType) {
            self.imagePickedBlock = handler
            controller.present(self.imageController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("ZBSImagePickerManager=> didFinishPickingMediaWithInfo")
        
        weak var weakSelf = self
        self.imageController.dismiss(animated: true) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let completed = weakSelf!.imagePickedBlock {
                completed(image)
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("ZBSImagePickerManager=> imagePickerControllerDidCancel")
        weak var weakSelf = self

        self.imageController.dismiss(animated: true) {
            if let completed = weakSelf!.imagePickedBlock {
                completed(nil)
            }
        }
    }
}

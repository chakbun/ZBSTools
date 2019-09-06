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

class ZBSImagePickerManager: NSObject {
    
    static let shared: ZBSImagePickerManager = ZBSImagePickerManager()
    
    private var imageController: UIImagePickerController
    
    private var imagePickedBlock: ZBSImagePickerBlock?
    
    public var popAtView: UIView?
    
    public var popStyle: UIModalPresentationStyle = .fullScreen;
    
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
            self.imageController.modalPresentationStyle = self.popStyle;
            if UIDevice.current.userInterfaceIdiom == .pad && self.popStyle != .fullScreen, let barItem = self.popAtView {
                self.imageController.popoverPresentationController?.barButtonItem = UIBarButtonItem.init(customView: barItem);
            }
            controller.present(self.imageController, animated: true, completion: nil)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ZBSImagePickerManager: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        weak var weakSelf = self
        self.imageController.dismiss(animated: true) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let completed = weakSelf!.imagePickedBlock {
                completed(image)
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        weak var weakSelf = self
        
        self.imageController.dismiss(animated: true) {
            if let completed = weakSelf!.imagePickedBlock {
                completed(nil)
            }
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension ZBSImagePickerManager: UINavigationControllerDelegate {
    
}

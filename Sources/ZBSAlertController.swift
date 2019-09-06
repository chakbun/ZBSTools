//
//  ZBSAlertController.swift
//
//
//  Created by jaben on 2019/8/25.
//  Copyright © 2019 Jaben. All rights reserved.
//

import UIKit

public typealias ZBSAction = (UIAlertAction)->Void

// MARK: - ZBSAction
public struct ZBSButton {
    var name: String
    var action: ZBSAction?
    var style: UIAlertAction.Style
    
    init(name: String, action: ZBSAction? = nil, style: UIAlertAction.Style = UIAlertAction.Style.default) {
        self.name = name
        self.action = action
        self.style = style
    }
}

// MARK: - ZBSAlertController
class ZBSAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public
    static public func simple2optionsAlertViewWith(name: String?,
                                                  message: String?,
                                                  yesButtonName: String,
                                                  yesButtonAction: ZBSAction? = nil,
                                                  noButtonName: String,
                                                  noButtonAction: ZBSAction? = nil
                                                  )->ZBSAlertController {
        return simpleAlertViewWith(name: name, message: message, buttons: ZBSButton(name: yesButtonName, action: yesButtonAction, style: .default), ZBSButton(name: noButtonName, action: noButtonAction, style: .cancel))
    }
    
    static public func simpleAlertViewWith(name: String?, message: String?, buttons: ZBSButton...)->ZBSAlertController  {
        return alertControllerWith(name: name, message: message, style: .alert, buttons: buttons)
    }
    
    static fileprivate func alertControllerWith(name: String?, message: String?, style: UIAlertController.Style, buttons: [ZBSButton])->ZBSAlertController  {
        let alertView = ZBSAlertController.init(title: name, message: message, preferredStyle: style)
        for button in buttons {
            let alertAction = UIAlertAction.init(title: button.name, style: button.style, handler: button.action)
            alertView.addAction(alertAction)
        }
        return alertView
    }
    
    public func presentedIn(_ controller: UIViewController, animated: Bool, completed: (()->Void)? = nil) {
        controller.present(self, animated: animated, completion: completed)
    }
}

// MARK: - ActionSheet
extension ZBSAlertController {
    static public func simpleActionSheetWith(name: String?, message: String?, buttons: ZBSButton...)->ZBSAlertController  {
        return alertControllerWith(name: name, message: message, style: .actionSheet, buttons: buttons)
    }
}

// MARK: - UIViewController
extension UIViewController {
    public func presentSimpleOptionsAlertViewWith(name: String?, message: String?, op1Name: String, op1Action: ZBSAction? = nil, op2Name: String, op2Action: ZBSAction? = nil) {
        self.present(ZBSAlertController.simple2optionsAlertViewWith(name: name, message: message, yesButtonName: op1Name, yesButtonAction: op1Action, noButtonName: op2Name, noButtonAction: op2Action), animated: true, completion: nil)
    }
    
    public func presentSimpleActionSheetWith(name: String?, message: String?, buttons: ZBSButton...) {
        self.present(ZBSAlertController.alertControllerWith(name: name, message: message, style: .actionSheet, buttons: buttons), animated: true, completion: nil)
    }
}




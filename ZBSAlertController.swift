//
//  ZBSAlertController.swift
//  RemoveBG
//
//  Created by jaben on 2019/8/25.
//  Copyright © 2019 Jaben. All rights reserved.
//

import UIKit

typealias ZBSAction = (UIAlertAction)->Void

// MARK: - ZBSAction
struct ZBSButton {
    var name: String
    var action: ZBSAction?
    var style: UIAlertAction.Style
    
    init(name: String, action: ZBSAction? = nil, style: UIAlertAction.Style = UIAlertAction.Style.default) {
        self.name = name;
        self.action = action;
        self.style = style;
    }
}


// MARK: - ZBSAlertController
class ZBSAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Extension
    static public func simple2OptionsAlertViewWith(name: String?,
                                                  message: String?,
                                                  yesButtonName: String,
                                                  yesButtonAction: ZBSAction? = nil,
                                                  noButtonName: String,
                                                  noButtonAction: ZBSAction? = nil
                                                  )->ZBSAlertController {
        return simpleOptionsAlertViewWith(name: name, message: message, buttons: ZBSButton(name: yesButtonName, action: yesButtonAction, style: .default), ZBSButton(name: noButtonName, action: noButtonAction, style: .cancel));
    }
    
    static public func simpleOptionsAlertViewWith(name: String?, message: String?, buttons: ZBSButton...)->ZBSAlertController  {
        
        let alertView = ZBSAlertController.init(title: name, message: message, preferredStyle: .alert);
        
        for button in buttons {
            let alertAction = UIAlertAction.init(title: button.name, style: .default, handler: button.action);
            alertView.addAction(alertAction);
        }
        return alertView;
    }
    
    public func presentedIn(_ controller: UIViewController, animated: Bool, completed: (()->Void)? = nil) {
        controller.present(self, animated: animated, completion: completed);
    }
}

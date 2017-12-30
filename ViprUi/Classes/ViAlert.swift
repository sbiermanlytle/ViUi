//
//  ViAlert.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

public struct ViAlert {
    
    // MARK: Informational
    // --------------------------------------------------------------------------
    public static func info(_ title: String, _ message: String?) -> UIAlertController {
        return ViAlert.standard(title: title, message: message, actionText: "Ok", actionStyle: .default, action: nil)
    }
    
    // MARK: Destructive
    // --------------------------------------------------------------------------
    public static func confirmDelete(_ title: String,
                                     _ message: String?,
                                     _ confirmAction: (() -> Void)?
        ) -> UIAlertController {
        return ViAlert.custom(title: title, message: message,
                              leftText: "Cancel", leftStyle: .cancel,
                              rightText: "Delete", rightStyle: .destructive,
                              leftAction: nil, rightAction: confirmAction)
    }
    
    // MARK: Generic with Buttons
    // --------------------------------------------------------------------------
    public static func standard(title: String,
                                message: String?,
                                actionText: String?,
                                actionStyle: UIAlertActionStyle = .default,
                                action: (() -> Void)?
        ) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: actionText, style: actionStyle) { (result : UIAlertAction) -> Void in
            if action != nil {
                action!()
            }
        }
        alertController.addAction(action)
        return alertController
    }
    
    // MARK: Custom with Buttons
    // --------------------------------------------------------------------------
    public static func custom(title: String,
                              message: String?,
                              leftText: String?,
                              leftStyle: UIAlertActionStyle = .default,
                              rightText: String?,
                              rightStyle: UIAlertActionStyle = .default,
                              leftAction: (() -> Void)?,
                              rightAction: (() -> Void)?
        ) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let nAction = UIAlertAction(title: leftText, style: leftStyle) { (result : UIAlertAction) -> Void in
            if leftAction != nil {
                leftAction!()
            }
        }
        alertController.addAction(nAction)
        let yAction = UIAlertAction(title: rightText, style: rightStyle) { (result : UIAlertAction) -> Void in
            if rightAction != nil {
                rightAction!()
            }
        }
        alertController.addAction(yAction)
        return alertController
    }
}

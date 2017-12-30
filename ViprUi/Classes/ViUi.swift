//
//  ViUi.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import UIKit

public struct ViUi {
    
    // MARK: Fonts
    // --------------------------------------------------------------------------
    public static func font(_ size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
        return UIFont(name: "Helvetica", size: size)!
    }
}

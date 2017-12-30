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
    public static func font(_ size: CGFloat, _ weight: UIFont.Weight) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return UIFont(name: "Helvetica", size: size)!
    }
}

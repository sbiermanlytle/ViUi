//
//  ViUi.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import UIKit

public struct ViUi {
    
    // MARK: String Formatting
    // --------------------------------------------------------------------------
    public static func formatNumber(_ value: Double, _ decimals: Int) -> String {
        let formatter = NumberFormatter()
        if decimals > 0 {
            formatter.numberStyle = NumberFormatter.Style.decimal
            //formatter.usesSignificantDigits = true
            //formatter.minimumSignificantDigits = 2
            formatter.minimumFractionDigits = decimals
            formatter.maximumFractionDigits = decimals
        }
        return formatter.string(from: (value) as NSNumber)!
    }
}

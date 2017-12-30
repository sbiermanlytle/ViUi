//
//  ViprUiExtensions.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

public extension Array {
    public func random() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

public extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    public var inverse: UIColor {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a)
    }
    
    public static func random() -> UIColor {
        return UIColor.init(red: UIColor.ra(0,255), green: UIColor.ra(0,255), blue: UIColor.ra(0,255))
    }
    
    public static func ra(_ lower: Int , _ upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public func hexString(_ includeAlpha: Bool = true) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
    
    public func asInt() -> UInt32 {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            
            var colorAsUInt : UInt32 = 0
            
            colorAsUInt += UInt32(red * 255.0) << 16 +
                UInt32(green * 255.0) << 8 +
                UInt32(blue * 255.0)
            return colorAsUInt
        }
        return 0
    }
}

extension Dictionary {
    mutating func merge(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

public extension Date {
    public static func > (lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
    }
    public static func < (lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate < rhs.timeIntervalSinceReferenceDate
    }
    public func formatted(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
    public var day: String {
        return self.formatted("EEEE")
    }
    public var month: String {
        return self.formatted("MMMM")
    }
    public var monthShort: String {
        return self.formatted("MMM")
    }
    public var dayOfMonth: String {
        return self.formatted("d")
    }
    public var monthOfYear: Int {
        return Calendar.current.component(.month,  from: self)
    }
    public var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    public var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    public var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    public var isFirstDayOfMonth: Bool {
        return Calendar.current.component(.day, from: self) == 1
    }
    public var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    public var normalized: Date {
        var comps = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second], from: self)
        
        comps.setValue(0, for: Calendar.Component.hour)
        comps.setValue(0, for: Calendar.Component.minute)
        comps.setValue(0, for: Calendar.Component.second)
        
        return NSCalendar.current.date(from: comps)!
    }
}

public extension String {
    static func obj(_ string: String) -> NSObject {
        return string as NSObject
    }
}

public extension UIActivityIndicatorView {
    func scale(_ factor: CGFloat) {
        guard factor > 0.0 else { return }
        
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}

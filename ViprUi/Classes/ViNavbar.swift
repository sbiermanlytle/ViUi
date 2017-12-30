//
//  ViNavbar.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViNavbar: UIView {
    public static let CN = "VprNavbar"
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    public static var cStatusBarHeight:CGFloat = 20
    public static var cNavbarHeight:CGFloat = 80
    
    public var title: UILabel = UILabel()
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    override public init (frame : CGRect) {
        super.init(frame : frame)
        _setupView()
    }
    
    convenience public init () {
        self.init(frame:CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Optional Standard UI Components
    // --------------------------------------------------------------------------
    open func standardSetup(_ title: String = "Vipr") {
        self.backgroundColor = .black
        _ = setupBlur()
        _ = setupBorder()
        _ = setupTitle(title)
    }
    
    open func setupBorder(_ width: CGFloat = 1.0) -> CALayer {
        let border = CALayer()
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        return border
    }
    
    open func setupBlur(_ style: UIBlurEffectStyle = UIBlurEffectStyle.light) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 0,
                                      width: self.frame.width,
                                      height: self.frame.height)
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.sendSubview(toBack: blurEffectView)
        return blurEffectView
    }
    
    open func setupTitle (_ text: String, _ color: UIColor) -> UILabel {
        title.frame = CGRect(x: 0,
                             y: ViNavbar.cStatusBarHeight + 6,
                             width: self.frame.width,
                             height: self.frame.size.height - ViNavbar.cStatusBarHeight - 6)
        title.text = text
        title.textAlignment = .center
        title.textColor = color
        if #available(iOS 8.2, *) {
            title.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        } else {
            // Fallback on earlier versions
        }
        self.addSubview(title)
        return title
    }
    
    open func setupTitle (_ text: String = "Vipr") -> UILabel {
        return self.setupTitle(text, .white)
    }
    
    // MARK: Optional Button UI Components
    // --------------------------------------------------------------------------
    
    open func setupTextButton (_ text: String = "Button") -> UIButton {
        let btn = UIButton()
        btn.frame = CGRect(x: 0,
                           y: ViNavbar.cStatusBarHeight + 6,
                           width: self.frame.width / 3,
                           height: self.frame.size.height - ViNavbar.cStatusBarHeight - 6)
        btn.setTitle(text, for: UIControlState.normal)
        btn.titleLabel?.textAlignment = .center
        
        if #available(iOS 8.2, *) {
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        } else {
            // Fallback on earlier versions
        }
        
        self.addSubview(btn)
        return btn
    }
    
    
    // MARK: Internal Functions
    // --------------------------------------------------------------------------
    
    private func _setupView () {
    }
}

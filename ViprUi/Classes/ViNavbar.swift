//
//  ViNavbar.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViNavbar: UIView {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    public var title: UILabel = UILabel()
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    override public init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    convenience public init () {
        self.init(frame:CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Standard Setup
    // --------------------------------------------------------------------------
    open func standardSetup(_ title: String = ViUi.cAppName) {
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        _ = setupBlur()
        _ = setupBorder()
        _ = setupTitle(title)
    }
    
    // MARK: Blur Layer
    // --------------------------------------------------------------------------
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
    
    // MARK: Border
    // --------------------------------------------------------------------------
    open func setupBorder(_ width: CGFloat = 0.5) -> CALayer {
        let border = CALayer()
        border.borderColor = UIColor.init(white: 0.8, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        return border
    }
    
    // MARK: Title
    // --------------------------------------------------------------------------
    open func setupTitle (_ text: String, _ color: UIColor) -> UILabel {
        title.frame = CGRect(x: 0,
                             y: ViUi.cStatusBarHeight + 6,
                             width: self.frame.width,
                             height: self.frame.size.height - ViUi.cStatusBarHeight - 6)
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
    
    open func setupTitle (_ text: String = ViUi.cAppName) -> UILabel {
        return self.setupTitle(text, .black)
    }
    
    // MARK: Buttons
    // --------------------------------------------------------------------------
    open func setupBackButton(_ title:String = "Back") -> UIButton {
        let btn:UIButton = UIButton.init(frame: CGRect(x: 0, y: ViUi.cStatusBarHeight,
                                                       width: self.frame.width / 4,
                                                       height: ViUi.cNavbarHeight - ViUi.cStatusBarHeight))
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(btn)
        return btn
    }
}

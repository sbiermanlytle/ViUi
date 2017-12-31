//
//  ViPage.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViPage: ViViewController {
    
    open var header: ViNavbar!
    open var hasBackButton: Bool = false
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavbar()
    }
    
    // MARK: Navbar
    // --------------------------------------------------------------------------
    open func setupNavbar() {
        header = ViNavbar(frame: CGRect(x: 0, y: 0,
                                        width: self.view.frame.width,
                                        height: ViUi.cNavbarHeight))
        header.standardSetup()
        self.view.addSubview(header)
        
        if hasBackButton {
            let btn: UIButton = header.setupBackButton("Back")
            btn.addTarget(self, action: #selector(backPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc func backPressed(_ sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
}

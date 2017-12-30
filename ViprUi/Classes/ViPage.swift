//
//  ViPage.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViPage: ViViewController {
    
    var header: ViNavbar!
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    // MARK: Navbar
    // --------------------------------------------------------------------------
    open func setupNavbar() {
        header = ViNavbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        header.standardSetup()
        self.view.addSubview(header)
    }
}

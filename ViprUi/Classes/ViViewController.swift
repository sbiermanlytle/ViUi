//
//  ViViewController.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViViewController: UIViewController {
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    // MARK: Subview Presentation
    // --------------------------------------------------------------------------
    open func presentAlert(_ title: String, _ message: String?) {
        self.present(ViAlert.info(title, message), animated: true, completion: nil)
    }
}

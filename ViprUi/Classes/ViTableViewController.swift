//
//  ViTableViewController.swift
//  Nimble
//
//  Created by iljn on 12/30/17.
//

import Foundation

open class ViTableViewController<T>: ViViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: Public Data
    // --------------------------------------------------------------------------
    open var tableView: UITableView = UITableView()
    open var refreshControl: UIRefreshControl!
    open var sections: [T] = []
    open var rows: [T] = []
    
    // MARK: View Control
    // --------------------------------------------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x:0, y:0,
                                 width: self.view.frame.size.width,
                                 height: self.view.frame.size.height);
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
    }
    
    open func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.bounds = CGRect(x: 0, y: -ViUi.cNavbarHeight, width: refreshControl.bounds.size.width, height: refreshControl.bounds.size.height)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //refreshControl.addTarget(self, action: #selector(ViTableViewController.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    open func refresh(_ sender:AnyObject) {
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
    // --------------------------------------------------------------------------
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        if self.sections.count == 0 {
            return 1
        }
        return self.sections.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.rows[indexPath.row] as? String
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    // --------------------------------------------------------------------------
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You selected cell #\(indexPath.row)!")
        
        //let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        //selectedCell.contentView.backgroundColor = UIColor.red
    }
}

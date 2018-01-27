//
//  DetailTableViewController.swift
//  EmptyKit-Demo
//
//  Created by archerzz on 22/11/2016.
//  Copyright © 2016 archerzz. All rights reserved.
//

import UIKit
import EmptyKit

final class DetailTableViewController: UITableViewController {
    
    var allDatasource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupEmpty()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDatasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)
        cell.textLabel?.text = allDatasource[indexPath.item]
        return cell
    }
    // MARK: - Actions
    @IBAction func add(_ sender: Any) {
        let string = String(allDatasource.count)
        allDatasource.insert(string, at: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
 
    @IBAction func remove(_ sender: Any) {
        allDatasource.removeAll()
        tableView.reloadData()
    }
    
}

// MARK: - Setup
extension DetailTableViewController {
    
    func setupEmpty() {
        tableView.ept.dataSource = self
        tableView.ept.delegate = self
    }
    
}


extension DetailTableViewController: EmptyDataSource {
    
    func imageForEmpty(in view: UIView) -> UIImage? {
        return UIImage(named: "empty_data_bookshelf")
    }

    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        let title = "Keine Aufträge gefunden \nEs befinden sich keine Aufträge in dem System. Bitte prüfen Sie nach ob bereits Dokumente vorliegen, dazu wählen Sie am Besten den Sync Button oder schauen einfach nur TV"
        let font = UIFont.systemFont(ofSize: 22)
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.black, .font: font]
        
        let empty_string = NSMutableAttributedString(string: title, attributes: attributes)
        empty_string.addAttribute(NSAttributedStringKey.font, value: UIFont.boldSystemFont(ofSize: 14),range: NSRange(location: 0, length: 23))
        
        return empty_string
    }
    
    
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        let title = "click me"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.white, .font: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.blue
    }
    
    func customViewForEmpty(in view: UIView) -> UIView? {
        return nil
    }
    

}

extension DetailTableViewController: EmptyDelegate {
   
    func emptyButton(_ button: UIButton, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
    }
    
    func emptyView(_ emptyView: UIView, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
    }
}

















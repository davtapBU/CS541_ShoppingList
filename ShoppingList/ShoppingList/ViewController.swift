//
//  ViewController.swift
//  ShoppingList
//
//  Created by David Tapia on 9/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewCell: UITableViewCell!
    
    let shoppingList = ShoppingList();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = shoppingList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func insertButtonPressed(sender: UIButton) {
        print("inserted an item into list: \(String(describing: itemTextField.text))")
        
        guard let text = itemTextField.text else{
            return
        }
        
        itemTextField.text = ""
        
        shoppingList.addItem(item: text)
        tableView.reloadData()
    }
    
    @IBAction func listItemPressed(sender: UITableViewCell) {
    }
}

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
    
    let shoppingList = ShoppingList();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = shoppingList
        
        shoppingList.loadItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnKeyPressed(sender: UITextField) {
        guard let text = itemTextField.text else{
            return
        }
        
        if(text != "")
        {
            print("inserted an item into list: \(String(describing: itemTextField.text))")
            shoppingList.addItem(item: text)
        }
        itemTextField.text = ""
        tableView.reloadData()
    }

    @IBAction func insertButtonPressed(sender: UIButton) {
        
        guard let text = itemTextField.text else{
            return
        }
        
        if(text != "")
        {
            print("inserted an item into list: \(String(describing: itemTextField.text))")
            shoppingList.addItem(item: text)
        }
        itemTextField.text = ""
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        self.tableView.isEditing = editing
    }
    
    @IBAction func startEditing(_ sender: UIButton) {
        isEditing = !isEditing
        setEditing(isEditing, animated: true)
    }
}

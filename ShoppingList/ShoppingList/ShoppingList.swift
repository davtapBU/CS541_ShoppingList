//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by David Tapia on 9/18/21.
//

import UIKit

class ShoppingList: NSObject {
    
    private var items: [String] = []
    
    func addItem(item:String) {
        items.append(item)
    }
}

extension ShoppingList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        return cell
    }
}

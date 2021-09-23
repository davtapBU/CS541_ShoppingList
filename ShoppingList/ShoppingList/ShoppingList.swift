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
    
    func removeItem(Idx:Int) {
        items.remove(at: Idx)
    }
    
    func addItemAt(item:String, Idx:Int){
        items.insert(item, at: Idx)
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.removeItem(Idx: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = items[sourceIndexPath.row]
        self.removeItem(Idx: sourceIndexPath.row)
        self.addItemAt(item: itemToMove, Idx: destinationIndexPath.row)
    }
}

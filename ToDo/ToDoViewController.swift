//
//  ViewController.swift
//  ToDo
//
//  Created by User on 7/31/19.
//  Copyright © 2019 Shanice Brown. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    @IBOutlet weak var editButtonLabel: UIBarButtonItem!
    @IBOutlet var toDoListTableView: UITableView!
    
    var itemArray = ["Buy Shoes", "Save $50", "Pay for prom ticket", "Pay Cell Phone Bill"]
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = itemArray[sourceIndexPath.row]
        itemArray.remove(at: sourceIndexPath.row)
        itemArray.insert(item, at: destinationIndexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:  indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            itemArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // Adding TableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // print(itemArray[indexPath.row])
        
    
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Rearranging Cells
    @IBAction func reOrderCells(_ sender: UIBarButtonItem) {
        toDoListTableView.isEditing = !toDoListTableView.isEditing
        
    
    }
    // Adding a new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
        
        // What happens when a user clicks the add item alert?  The text field is reloaded with the new item added as another indexof the array  and then it populates the table view.
        
        
self.itemArray.append(textField.text!)
        
self.tableView.reloadData()
        
    }
    
    alert.addTextField { (alertTextField) in
    alertTextField.placeholder = "Create new item"
    textField = alertTextField
}
        alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
}

}
        
        
        
        




//
//  ViewController.swift
//  TestTableView
//
//  Created by vourest on 2/14/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var itemArray = ["Nunu", "Denis", "Hafid", "Entah"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "namaTVC", for: indexPath) as? namaTVC {
        
        cell.lblNama.text = itemArray[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        print("Get Value \(self.itemArray[indexPath.row]) success ")

        
// alertt pop up
        
//        let alert = UIAlertController(title: "Are U Sure to Delete It?", message: "", preferredStyle: .alert)
//
//        let action =  UIAlertAction(title: "Delete", style: .default) { (action) in
//
//            // di sini adalah apa yg terjadi ketika user klik button dan alert
//            print("Delete \(self.itemArray[indexPath.row]) success ")
//        }
//
//        alert.addAction(action)
//
//        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func btnAdd(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new List Nama item", message: "", preferredStyle: .alert)
        
        let action =  UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // di sini adalah apa yg terjadi ketika user klik button dan alert
            
            print("get value \(textField.text!) Success")
            print(self.itemArray.count)
            self.itemArray.append(textField.text!)
            print(self.itemArray.count)
            
            self.tblView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
}


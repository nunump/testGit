//
//  ViewController.swift
//  TestTableView
//
//  Created by vourest on 2/14/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var itemArray = [Item]() // isi defaultnya di ambil dari yg ada di func didload
    //let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       print("\(dataFilePath) Ini Data File Path")
        
        loadItem()
        
        tblView.delegate = self
        tblView.dataSource = self
        //tblView.separatorColor = UIColor.clear
        
       
        
        print("didload show")
        
//        if let item = defaults.array(forKey: "ToDoListArray") as? [Item] {
//            itemArray = item
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Did appear show")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if let cell = UITableViewCell(style: .default, reuseIdentifier: "namaTVC") as? namaTVC {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "namaTVC", for: indexPath) as? namaTVC {
        
        let item = itemArray[indexPath.row]
            
        cell.lblNama.text = item.nama
        cell.lblAlamat.text = item.alamat
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Are U Sure to Delete It?", message: "", preferredStyle: .alert)
            
            let action =  UIAlertAction(title: "Delete", style: .default) { (action) in
                
                self.context.delete(self.itemArray[indexPath.row])
                self.itemArray.remove(at: indexPath.row)
                self.tblView.reloadData()
            }
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new List Nama item", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            
            let newItem = Item(context: self.context)
            newItem.nama = textField.text!
            
            self.itemArray[indexPath.row].nama = newItem.nama
            
            tableView.deselectRow(at: indexPath, animated: true)
            self.tblView.reloadData()
            
        }))
        
        alert.addTextField { (alertTextField) in
            alertTextField.text = self.itemArray[indexPath.row].nama!
            textField = alertTextField
        }
        
        
        
        present(alert, animated: true, completion: nil)
        
        

    }
    
    @IBAction func btnAdd(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new List Nama item", message: "", preferredStyle: .alert)
        
        let action =  UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
            let newItem = Item(context: self.context)
            newItem.nama = textField.text!
            self.itemArray.append(newItem)
            
            
       
            print("get value \(textField.text!) Success")

            self.tblView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func saveItem(){
        do {
            try context.save()
        } catch {
            print("Error save data")
        }
        
        tblView.reloadData()
    }
    
    func loadItem(){
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error Load Data from Database \(error)")
        }
    }
    
}


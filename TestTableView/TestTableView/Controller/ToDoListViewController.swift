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
        
        // isi array defaults, gak usah jg gak papa
        
//        let newItem = Item(context: self.context)
//        newItem.nama = "Nunu"
//        newItem.alamat = "Purbalingga"
//        itemArray.append(newItem)
//
//        let newItem1 = Item(context: self.context)
//        newItem1.nama = "Hafid"
//        newItem1.alamat = "BBS"
//        itemArray.append(newItem1)
        
//        let newItem2 = Item()
//        newItem2.nama = "Denis"
//        newItem2.alamat = "Jogja"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.nama = "Tri"
//        newItem3.alamat = "Sumatra"
//        itemArray.append(newItem3)
//
//        let newItem4 = Item()
//        newItem4.nama = "Wilian"
//        newItem4.alamat = "Magelang"
//        itemArray.append(newItem4)
        
        tblView.delegate = self
        tblView.dataSource = self
        tblView.separatorColor = UIColor.clear
        
       
        
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
            
            //save array to pc
            //self.defaults.set(self.itemArray, value(forKey: "TodoListArray"))
            
            
            
            let newItem = Item(context: self.context)
            newItem.nama = textField.text!
            self.itemArray.append(newItem)
            
            
            
            //.append(textField.text!)
            //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            print("get value \(textField.text!) Success")
//            print(self.itemArray.count)
//
//            print(self.itemArray.count)
            
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


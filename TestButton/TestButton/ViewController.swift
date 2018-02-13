//
//  ViewController.swift
//  TestButton
//
//  Created by vourest on 2/13/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // array button
    var arrButton = ["But1", "But2", "But3", "But4", "But5"]
    
    var selecButton = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func btnBareng(_ sender: UIButton) {
        selecButton = arrButton[sender.tag - 1]
        
        if selecButton == "But1" {
            print("Clicked By Button 1")
        } else if selecButton == "But2" {
            print("Clicked By Button 2")
        } else if selecButton == "But3" {
            print("Clicked By Button 3")
        } else if selecButton == "But4" {
            print("Clicked By Button 4")
        } else if selecButton == "But5" {
            print("Clicked By Button 5")
        }
        
    }
    
}


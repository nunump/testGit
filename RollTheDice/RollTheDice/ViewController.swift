//
//  ViewController.swift
//  RollTheDice
//
//  Created by vourest on 2/13/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // mark iboutlet
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    // var instance
    var arrayDice = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var randomIndexImage1: Int = 0
    var randomIndexImage2: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    // mark ibaction
    @IBAction func btnRoll(_ sender: Any) {
        roll()
    }
    
    func roll(){
        randomIndexImage1 = Int(arc4random_uniform(6))
        randomIndexImage2 = Int(arc4random_uniform(6))
        
        // debug and run
        print("\(randomIndexImage1) | random index 1")
        print("\(randomIndexImage2) | random index 2")
        
        diceImage1.image = UIImage(named: arrayDice[randomIndexImage1])
        diceImage2.image = UIImage(named: arrayDice[randomIndexImage2])
        
    }


}


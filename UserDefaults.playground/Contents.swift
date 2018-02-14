//: Playground - noun: a place where people can play

import UIKit

let dictionaryKey = "myDictionary"
let defaults = UserDefaults.standard

defaults.set(200.0, forKey: "Angka")
defaults.setValue("Nunu", forKey: "Nama")
let arra = [1,2,3,4,5,6,7]
defaults.set(arra, forKey: "array")

let dictionary = ["AB" : "Yogyakarta", "R" : "Banyumas", "AD": "Solo"]
defaults.set(dictionary, forKey: dictionaryKey)


let nama = defaults.string(forKey: "Nama")
let angka = defaults.double(forKey: "Angka")
let angka1 = defaults.object(forKey: "Nama")
let myArray = defaults.array(forKey: "array")  as! [Int]
let myDictionary = defaults.dictionary(forKey: dictionaryKey)


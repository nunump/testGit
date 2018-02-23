//
//  LoginPage.swift
//  TestIOSTahap2
//
//  Created by vourest on 2/23/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit

class LoginPageVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myURL =  NSURL(string: "http://www.swiftdeveloperblog.com/http-post-example-script")
//        let request = NSMutableURLRequest(url: myURL! as URL);
//        request.httpMethod = "POST"
//
//        let postString = "firstName=James&lastName=Bond"
//
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//
//            if error != nil {
//                print("error=\(error)")
//                return
//            }
//
//            print("\(response) | response")
//        }
        
    }
    
    
    @IBAction func btnLoginAct(_ sender: Any) {
        let username = txtEmail.text
        let password = txtPassword.text
        
        if (username == "" || password == ""){
            return
        }
        
        DoLogin(username!, password!)
    }
    
    func DoLogin(_ user: String, _ pass: String){
        
    }
}

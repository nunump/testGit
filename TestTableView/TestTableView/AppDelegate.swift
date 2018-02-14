//
//  AppDelegate.swift
//  TestTableView
//
//  Created by vourest on 2/14/18.
//  Copyright © 2018 adv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // ini yg paling pertama di jalankan sebelum didload
        print("Did finish launching with option")
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App masuk ke dalam background") // ini ketika smartphone masuk ke home (background)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
      print("App will terminate")
    }


}


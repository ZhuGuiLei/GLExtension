//
//  AppDelegate.swift
//  Extension
//
//  Created by apple on 2019/11/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        let vc = ViewController.init()
        let nav = UINavigationController.init(rootViewController: vc)
        window?.rootViewController = nav
        
        
        
        return true
    }



}


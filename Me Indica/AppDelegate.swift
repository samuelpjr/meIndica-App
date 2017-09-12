//
//  AppDelegate.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import TwitterKit
import Parse




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //API Twitter
        //Fabric.with([Twitter.self])
        Twitter.sharedInstance().start(withConsumerKey:"WoTzlzgdG2B5SXULPM2xjPnlq", consumerSecret:"CxLTgw6HeK3e6CCOP4OFLYItC5kYvIkCeKZuv0vgriKXGoajRz")

        
        //API Parse
        //Initialize Parse.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "qab4kDUb7GMuUlFNR7997uMax8oAT5SauVc8zfsC"
            $0.clientKey = "mzKtOZ79N8uOUX60eIuZPqbLOfcSsABBx1ONhsSN"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
        
        //Cores
        UITabBar.appearance().tintColor = UIColor(red: 255/255.0, green: 59/255.0, blue: 48/255.0, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 255/255.0, green: 59/255.0, blue: 48/255.0, alpha: 1.0)]
        
        
        
        return true
    }
    
    
}

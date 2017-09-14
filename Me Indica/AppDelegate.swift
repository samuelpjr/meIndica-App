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
        Twitter.sharedInstance().start(withConsumerKey:"WoTzlzgdG2B5SXULPM2xjPnlq", consumerSecret:"CxLTgw6HeK3e6CCOP4OFLYItC5kYvIkCeKZuv0vgriKXGoajRz")

        //API Parse
        //Initialize Parse.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "qab4kDUb7GMuUlFNR7997uMax8oAT5SauVc8zfsC"
            $0.clientKey = "mzKtOZ79N8uOUX60eIuZPqbLOfcSsABBx1ONhsSN"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
        return true
    }
    
    
}

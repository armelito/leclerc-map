//
//  AppDelegate.swift
//  leclerc-ios
//
//  Created by Armel Cantin on 24/12/2018.
//  Copyright © 2018 Armel Cantin. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
//import FirebaseFirestore
import UserNotifications
import GoogleMaps
import GooglePlaces


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(hex:"0B70B5")
        
        let center = UNUserNotificationCenter.current()
        // Request permission to display alerts and play sounds.
        center.requestAuthorization(options: [.alert, .sound, .badge])
        { (granted, error) in
            // Enable or disable features based on authorization.
            print("granted")
        }
        
        GMSPlacesClient.provideAPIKey("AIzaSyB65QRKFsc2I-8N26fu-p_ct1j3_lhVWXc")
        GMSServices.provideAPIKey("AIzaSyB65QRKFsc2I-8N26fu-p_ct1j3_lhVWXc")
        //        Thread.sleep(forTimeInterval: 1)
        // Override point for customization after application launch.
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


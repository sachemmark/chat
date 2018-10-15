//
//  AppDelegate.swift
//  Chat
//
//  Created by Mark Yankovsky on 9/21/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var previousState: UIApplication.State = .inactive
    var isLoggingEnabled: Bool = true // set false to disable state logging
    
    func getStateString(_ state: UIApplication.State) -> String {
        switch state {
        case .active:
            return "Active"
        case .inactive:
            return "Inactive"
        case .background:
            return "Background"
        }
    }
    
    func logState(currentState: UIApplication.State, method: String) {
        if isLoggingEnabled {
            
            // made this cause "moved from active to active" or "moved from background to background" is meaningless
            if (method == "applicationDidEnterBackground" ||
                method == "applicationDidBecomeActive") {
                print ("Application moved from", getStateString(previousState), "to", getStateString(currentState), ":", method)
            } else {
                print(method)
            }
            previousState = currentState
        }
    }
    
    func setTheme() {
        switch UserDefaults.standard.integer(forKey: "theme") {
        case 1:
            UINavigationBar.appearance().barTintColor = Themes.theme1.0
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme1.1]
            UIApplication.shared.statusBarStyle = Themes.theme1.2
        case 2:
            UINavigationBar.appearance().barTintColor = Themes.theme2.0
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme2.1]
            UIApplication.shared.statusBarStyle = Themes.theme2.2
        case 3:
            UINavigationBar.appearance().barTintColor = Themes.theme3.0
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme3.1]
            UIApplication.shared.statusBarStyle = Themes.theme3.2
        default:
            UserDefaults.standard.set(1, forKey: "theme")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setTheme()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        logState(currentState: UIApplication.shared.applicationState, method: "applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        logState(currentState: UIApplication.shared.applicationState, method: "applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        logState(currentState: UIApplication.shared.applicationState, method: "applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        logState(currentState: UIApplication.shared.applicationState, method: "applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        logState(currentState: UIApplication.shared.applicationState, method: "applicationWillTerminate")
    }


}


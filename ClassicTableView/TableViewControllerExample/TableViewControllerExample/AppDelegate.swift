//
//  AppDelegate.swift
//  TableViewControllerExample
//
//  Created by Xiyue Suo on 1/28/22.
//

import UIKit

/*
 1. remoove view controller from storyboard and remove the code
 2. add a tableViewController to the storyboard and add "cell" as reusable identifier
 3. make the tableView as initial VC
 4. add Table ViewCoontroller code file and map UI and code file
 5. remove boiler plate code and have 2 function numberOfRowsiNsection
 6. add
 7. return
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


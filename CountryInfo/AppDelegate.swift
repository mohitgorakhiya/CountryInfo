//
//  AppDelegate.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        We need a window, and something to display in this window,
//        we have removed storyboard so giving rootview controller from here
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let countryVC = CountryViewController.init()
        let navigationController = UINavigationController.init(rootViewController: countryVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

class Connectivity {
    // To check for is internet available or not
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

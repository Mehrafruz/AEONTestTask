//
//  AppDelegate.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let signInContext = SignInContext()
        let signInContainer = SignInContainer.assemble(with: signInContext)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = signInContainer.viewController
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }



}


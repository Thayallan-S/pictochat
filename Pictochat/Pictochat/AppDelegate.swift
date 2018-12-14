//
//  AppDelegate.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appFlowController: AppFlowController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appFlowController = AppFlowController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appFlowController
        window?.makeKeyAndVisible()
        
        appFlowController.start()
        
        return true
    }

}


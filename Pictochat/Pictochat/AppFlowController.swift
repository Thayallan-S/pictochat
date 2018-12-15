//
//  AppFlowController.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit

class AppFlowController: UIViewController {
    
    private let splashViewController = SplashViewController()
    private let launchFlowController = LaunchFlowController()
    //private let homeFlowController = HomeFlowController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        presentSplashViewController()
    }
}

// MARK: - SplashViewController Flow
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        
        let deadline = DispatchTime.now() + 3.5
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController)
        startHomeFlowController()
    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func startHomeFlowController() {
        launchFlowController.modalTransitionStyle = .coverVertical
        present(launchFlowController, animated: false, completion: nil)
        launchFlowController.start()
        
        //homeFlowController.modalTransitionStyle = .crossDissolve
       // present(homeFlowController, animated: true, completion: nil)
       // homeFlowController.start()
    }
}

//
//  LaunchFlowController.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class LaunchFlowController: UIViewController, UITextFieldDelegate {
    
    private let launchViewController = LaunchViewController()
    private let homeFlowController = HomeFlowController() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.launchViewController.textView.textField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Pictochatr.user = launchViewController.textView.textField.text!
        self.launchViewController.textView.textField.endEditing(true)
        homeFlowController.modalTransitionStyle = .crossDissolve
        present(homeFlowController, animated: true, completion: nil)
        homeFlowController.start()
        return false
    }
    
    func start() {
        add(childController: launchViewController)
    }
}


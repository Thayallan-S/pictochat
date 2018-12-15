//
//  UIViewController+AddRemoveChildren.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(childController: UIViewController) {
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
    func remove(childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
}

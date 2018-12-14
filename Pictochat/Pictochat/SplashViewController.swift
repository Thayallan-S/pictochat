//
//  SplashViewController.swift
//  Pictochat
//
//  Created by Kartik on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import Lottie
import EasyPeasy

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        
        let imageView = UIImageView(image: UIImage(named: "chuteLogo"))
        view.addSubview(imageView)
        imageView.easy.layout(CenterX(), Width(375), Height(300), Top(150))
        
        let animationView = LOTAnimationView(name: "splash-view-controller-animation")
        self.view.addSubview(animationView)
        print("\(animationView.animationDuration)")
        animationView.play()
    }
}

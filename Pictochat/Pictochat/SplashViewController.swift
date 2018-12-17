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
import Then

class SplashViewController: UIViewController {
    
    private let background = Background()
    
    private let logoName = UIImageView().then {
        $0.image = UIImage(named: "whiteLogo")
        $0.contentMode = .scaleAspectFill
    }
    
    private let logoIcon = UIImageView().then {
        $0.image = UIImage(named: "dsIcon")
        $0.contentMode = .scaleAspectFill
    }
    
    private let sloganLabel = UILabel().then {
        $0.font = UI.Font.slogan
        $0.textColor = UI.Colors.white
        $0.text = "OFFLINE MESSAGING & CHATROOMS"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        layoutViews()
    }
    
    func layoutViews() {
        view.addSubview(background)
        background.easy.layout(CenterX(),CenterY(-25))
        
        view.addSubview(logoName)
        logoName.easy.layout(Width(280), CenterX(-25), Top(300))
        
        view.addSubview(logoIcon)
        logoIcon.easy.layout(Left(5).to(logoName), Width(50), Top(300))
        
        view.addSubview(sloganLabel)
        sloganLabel.easy.layout(CenterX(), Top(5).to(logoName))
    }
}

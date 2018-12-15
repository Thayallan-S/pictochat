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
    
    private let titleLabel = UILabel().then {
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
        background.easy.layout(CenterX(),CenterY(-75))
        
        view.addSubview(titleLabel)
        titleLabel.easy.layout(CenterX(), CenterY())
    }
}

//
//  LaunchViewController.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class LaunchViewController: UIViewController {
    
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
        $0.text = "OFFLINE MESSAGING"
    }
    
    let textView = LaunchViewTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        
    }
    
}

extension LaunchViewController {
    func layoutViews() {
        view.addSubview(background)
        background.easy.layout(CenterX(),CenterY(-25))
        
        view.addSubview(logoName)
        logoName.easy.layout(Width(280), CenterX(-25), Top(200))
        
        view.addSubview(logoIcon)
        logoIcon.easy.layout(Left(5).to(logoName), Width(50), Top(200))
        
        view.addSubview(sloganLabel)
        sloganLabel.easy.layout(CenterX(), Top(5).to(logoName))
        
        view.addSubview(textView)
        textView.easy.layout(Width(300), Height(55), CenterX(), Top(30).to(sloganLabel))
    }
}

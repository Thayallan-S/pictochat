//
//  LaunchViewTextView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//


import UIKit
import EasyPeasy
import Then

class LaunchViewTextView: UIView {
    
    let contentview = UIView()
    
    let textField = UITextField().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.miniTitle
        $0.placeholder = "ENTER A USER NAME"
        $0.keyboardType = .default
    }
    
    init() {
        super.init(frame: .zero)
        
        
        setupProperties()
        layoutViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension LaunchViewTextView {
    func setupProperties() {
        contentview.backgroundColor = UI.Colors.white
        contentview.layer.borderWidth = 0.5
        contentview.layer.borderColor = UI.Colors.grey.cgColor
        contentview.layer.cornerRadius = 28.0
    }
    
    func layoutViews() {
        addSubview(contentview)
        contentview.easy.layout(Edges())
        
        contentview.addSubview(textField)
        textField.easy.layout(Width(270), Height(55), CenterX(), CenterY())
    }
}

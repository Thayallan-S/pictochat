//
//  CreateButtonView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol CreateButtonDelegate: class {
    func didTapCreate()
}

class CreateButtonView: UIView {
    
    weak var delegate: CreateButtonDelegate?
    
    let createButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapCreate()
    }
    
    
    private let contentView = UIView()
    
    private let createLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.subTitle
        $0.text = "CREATE"
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

extension CreateButtonView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.green
        contentView.layer.cornerRadius = 22
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(createLabel)
        createLabel.easy.layout(CenterX(), CenterY())
        
        contentView.addSubview(createButton)
        createButton.easy.layout(Edges())
    }
}

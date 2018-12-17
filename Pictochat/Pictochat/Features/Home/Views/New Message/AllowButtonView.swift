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

protocol AllowButtonDelegate: class {
    func didTapAllow()
}

class AllowButtonView: UIView {
    
    weak var delegate: AllowButtonDelegate?
    
    let allowButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapAllow()
    }
    
    
    private let contentView = UIView()
    
    private let allowLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.subTitle
        $0.text = "ALLOW"
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

extension AllowButtonView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.green
        contentView.layer.cornerRadius = 22
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(allowLabel)
        allowLabel.easy.layout(CenterX(), CenterY())
        
        contentView.addSubview(allowButton)
        allowButton.easy.layout(Edges())
    }
}

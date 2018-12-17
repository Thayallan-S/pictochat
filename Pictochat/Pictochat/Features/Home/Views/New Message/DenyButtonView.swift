//
//  DenyButtonView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-17.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then


protocol DenyButtonDelegate: class {
    func didTapDeny()
}

class DenyButtonView: UIView {
    
    weak var delegate: DenyButtonDelegate?
    
    let denyButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapDeny()
    }
    
    
    private let contentView = UIView()
    
    private let denyLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.subTitle
        $0.text = "DENY"
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

extension DenyButtonView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.red
        contentView.layer.cornerRadius = 22
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(denyLabel)
        denyLabel.easy.layout(CenterX(), CenterY())
        
        contentView.addSubview(denyButton)
        denyButton.easy.layout(Edges())
    }
}


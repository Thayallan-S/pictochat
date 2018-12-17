//
//  PublicVisibleView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol NewChatRoomViewDelegate: class {
    func didTapNewChatroom()
}

class PublicVisibleView: UIView {
    
    private let contentView = UIView()
    
    private let groupIcon = UIImageView().then {
        $0.image = UIImage(named: "findIcon")
        $0.contentMode = .scaleAspectFill
    }
    
    weak var delegate: NewChatRoomViewDelegate?
    
    private let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapNewChatroom()
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

extension PublicVisibleView {
    func setupProperties() {
        contentView.layer.backgroundColor = UI.Colors.white.cgColor
        contentView.layer.cornerRadius = 35
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

extension PublicVisibleView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(groupIcon)
        groupIcon.easy.layout(CenterX(), CenterY(), Width(26), Height(26))
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
    }
}


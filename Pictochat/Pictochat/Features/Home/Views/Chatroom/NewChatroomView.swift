//
//  NewChatroomView.swift
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

class NewChatroomView: UIView {
    
    private let contentView = UIView()
    
    private let groupIcon = UIImageView().then {
        $0.image = UIImage(named: "groupIcon")
        $0.contentMode = .scaleAspectFill
    }
    
    private let addIcon = UIImageView().then {
        $0.image = UIImage(named: "addIcon")
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

extension NewChatroomView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 35
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

extension NewChatroomView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        
        contentView.addSubview(groupIcon)
        groupIcon.easy.layout(CenterX(), CenterY())
        
        contentView.addSubview(addIcon)
        addIcon.easy.layout(Top(), Right())
        
        contentView.addSubview(selectionButton)
        selectionButton.easy.layout(Edges())
    }
}


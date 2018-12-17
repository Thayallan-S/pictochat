//
//  ChatroomCardView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class ChatroomCardView: UIView {
    
    private let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.white
        $0.layer.cornerRadius = 20
    }
    
    private let availableUserLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.subTitle
        $0.text = "Chatroom 1"
    }
    
    private let line = UIView().then {
        $0.backgroundColor = UI.Colors.grey
    }
    
    let messageView = UIView()
    
    let messageIcon = UIImageView().then {
        $0.image = UIImage(named: "groupIcon")
        $0.contentMode = .scaleAspectFill
    }
    
    init() {
        super.init(frame: .zero)
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatroomCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(availableUserLabel)
        availableUserLabel.easy.layout(Left(15), CenterY())
        
        contentView.addSubview(line)
        line.easy.layout(Right(80), Width(5), Height(55), CenterY())
        
        contentView.addSubview(messageView)
        messageView.easy.layout(Width(80),Height(55), Left().to(line), CenterY())
        
        messageView.addSubview(messageIcon)
        messageIcon.easy.layout(CenterX(), CenterY())
        
        
    }
}

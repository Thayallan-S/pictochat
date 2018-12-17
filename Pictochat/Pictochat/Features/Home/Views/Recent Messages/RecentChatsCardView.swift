//
//  RecentChatsCardView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then


protocol RecentChatsViewDelegate: class {
    func didTapCloseRC()
}

class RecentChatsCardView: UIView {
    
    weak var delegate: RecentChatsViewDelegate?
    
    let closeButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapCloseRC()
    }
    
    let contentView = UIView()
    
    private let recentChatsLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.subTitle
        $0.text = "Recent Chats"
    }
    
    let exitIcon = UIImageView().then {
        $0.image = UIImage(named: "closeIcon")
        $0.contentMode = .scaleAspectFill
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

extension RecentChatsCardView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 35
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

extension RecentChatsCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(exitIcon)
        exitIcon.easy.layout(Top(), Left())
        
        contentView.addSubview(closeButton)
        closeButton.easy.layout(Width(30), Height(30), Top(), Left())
        
        contentView.addSubview(recentChatsLabel)
        recentChatsLabel.easy.layout(Left(35), Top(20))
        
        
    }
}

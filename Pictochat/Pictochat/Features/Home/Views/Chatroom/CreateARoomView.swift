//
//  CreateARoomView.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol CreateARoomViewDelegate: class {
    func didTapCloseCRV()
}

class CreateARoomView: UIView {
    
    weak var delegate: CreateARoomViewDelegate?
    
    let closeButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapCloseCRV()
    }
    
    let contentView = UIView()
    
    private let createARoomLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.subTitle
        $0.text = "Create a Room"
    }
    
    let textView = NewChatroomTextView()
    
    let exitIcon = UIImageView().then {
        $0.image = UIImage(named: "closeIcon")
        $0.contentMode = .scaleAspectFill
    }
    
    let createButton = CreateButtonView()
    
    init() {
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateARoomView {
    func setupProperties() {
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 35
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

extension CreateARoomView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        contentView.addSubview(exitIcon)
        exitIcon.easy.layout(Top(), Right())
        
        contentView.addSubview(closeButton)
        closeButton.easy.layout(Width(30), Height(30), Top(), Right())
        
        contentView.addSubview(createARoomLabel)
        createARoomLabel.easy.layout(Left(35), Top(20))
        
        contentView.addSubview(textView)
        textView.easy.layout(Width(280), Height(50), CenterX(), Top(5).to(createARoomLabel))
        
        contentView.addSubview(createButton)
        createButton.easy.layout(CenterX(), Top(15).to(textView), Width(180), Height(45))
        
    }
} 

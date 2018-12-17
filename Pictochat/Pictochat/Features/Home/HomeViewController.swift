//
//  HomeViewController.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeViewController: UIViewController {

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
        $0.text = "OFFLINE CHATROOMS"
    }
    

    private let chatroomsNearYouLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.miniTitle
        $0.text = "CHATROOMS"
    }
    
    
    let newChatRoomButton = NewChatroomView()
    let recentMessagesButton = RecentMessagesView()
    
    let createRoomView = CreateARoomView()
    let recentChatsView = RecentChatsCardView()
    
    let backgroundCover = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        
    }
}


extension HomeViewController {
    func layoutViews() {
        view.addSubview(background)
        background.easy.layout(CenterX(),CenterY(-25))
        
        view.addSubview(logoName)
        logoName.easy.layout(Width(280), CenterX(-25), Top(40))
        
        view.addSubview(logoIcon)
        logoIcon.easy.layout(Left(5).to(logoName), Width(50), Top(40))
        
        view.addSubview(sloganLabel)
        sloganLabel.easy.layout(CenterX(), Top(5).to(logoName))
        
        view.addSubview(chatroomsNearYouLabel)
        chatroomsNearYouLabel.easy.layout(Left(20), Top(20).to(sloganLabel))
        
        view.addSubview(newChatRoomButton)
        newChatRoomButton.easy.layout(Left(25), Width(70), Height(70), Bottom(40))
        
        view.addSubview(recentMessagesButton)
        recentMessagesButton.easy.layout(Right(25), Width(70), Height(70), Bottom(40))
    }
}

extension HomeViewController {
    func createARoom() {
        view.addSubview(backgroundCover)
        backgroundCover.easy.layout(Edges())

        view.addSubview(createRoomView)
        createRoomView.easy.layout(CenterX(), Width(335), Height(190), Top(200))
    }
    
    func recentMessages() {
        view.addSubview(backgroundCover)
        backgroundCover.easy.layout(Edges())
        
        view.addSubview(recentChatsView)
        recentChatsView.easy.layout(CenterX(), Width(335), Height(190), Top(200))
    }
}

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
        $0.text = "OFFLINE MESSAGING"
    }
    

    private let usersNearYouLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.miniTitle
        $0.text = "USERS NEAR YOU"
    }
    
    
    let newChatRoomButton = PublicVisibleView()
    let recentMessagesButton = RecentMessagesView()
    
    let allowUserView = PublicVisibleCardView()
    let recentChatsView = RecentChatsCardView()
    
    let backgroundCover = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    var users = [UserCardView]()
    var counter = 0
    
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
        
        view.addSubview(usersNearYouLabel)
        usersNearYouLabel.easy.layout(Left(20), Top(20).to(sloganLabel))
        
        view.addSubview(newChatRoomButton)
        newChatRoomButton.easy.layout(Left(25), Width(70), Height(70), Bottom(40))
        
        view.addSubview(recentMessagesButton)
        recentMessagesButton.easy.layout(Right(25), Width(70), Height(70), Bottom(40))
    }
}

extension HomeViewController {
    func allowUserMode() {
        view.addSubview(backgroundCover)
        backgroundCover.easy.layout(Edges())

        view.addSubview(allowUserView)
        allowUserView.easy.layout(CenterX(), Width(335), Height(150), Top(200))
    }
    
    func recentMessages() {
        view.addSubview(backgroundCover)
        backgroundCover.easy.layout(Edges())
        
        view.addSubview(recentChatsView)
        recentChatsView.easy.layout(CenterX(), Width(335), Height(190), Top(200))
    }
    
    func newRequest() {
        users.append(UserCardView())
        users[counter].availableUserLabel.text = Pictochatr.knownUsers[counter]
        view.addSubview(users[counter])
        if users.count <= 1 {
            users[counter].easy.layout(Width(335), CenterX(), Height(55), Top(15).to(usersNearYouLabel))
        }
        else {
            users[counter].easy.layout(Width(335), CenterX(), Height(55), Top(15).to(users[counter-1]))
        }
        
        counter = counter + 1
    }
}

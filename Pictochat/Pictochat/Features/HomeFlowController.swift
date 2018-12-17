//
//  HomeFlowController.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeFlowController: UIViewController {

    private let homeViewController = HomeViewController()
    private let splashViewController = SplashViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeViewController.newChatRoomButton.delegate = self
        self.homeViewController.createRoomView.textView.textField.delegate = self
        self.homeViewController.createRoomView.delegate = self
        self.homeViewController.createRoomView.createButton.delegate = self
        self.homeViewController.recentMessagesButton.delegate = self
        self.homeViewController.recentChatsView.delegate = self
        
    }
    
    func start() {
        add(childController: homeViewController)
    }
}

extension HomeFlowController: NewChatRoomViewDelegate {
    func didTapNewChatroom() {
        homeViewController.createARoom()
    }
}

extension HomeFlowController: CreateARoomViewDelegate {
    func didTapCloseCRV() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.createRoomView.removeFromSuperview()
    }

}

extension HomeFlowController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.homeViewController.createRoomView.textView.textField.endEditing(true)
        return false
    }
}

extension HomeFlowController: CreateButtonDelegate {
    func didTapCreate() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.createRoomView.removeFromSuperview()
    }
}

extension HomeFlowController: RecentMessagesViewDelegate {
    func didTapRecentChats() {
        homeViewController.recentMessages()
    }
}

extension HomeFlowController: RecentChatsViewDelegate {
    func didTapCloseRC() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.recentChatsView.removeFromSuperview()
    }
}


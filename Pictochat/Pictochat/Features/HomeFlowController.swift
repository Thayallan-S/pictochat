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
import MultipeerConnectivity

class HomeFlowController: UIViewController {

    private let homeViewController = HomeViewController()
    private let splashViewController = SplashViewController()
    
    private var advertiser: MCNearbyServiceAdvertiser!
    private var browser: MCNearbyServiceBrowser!
    private var localPeerID: MCPeerID!
    private var session: MCSession!
    let serviceType = "Pictochatr"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.localPeerID = MCPeerID(displayName: Pictochatr.user)
        self.session = MCSession(peer: localPeerID, securityIdentity: nil, encryptionPreference: .required)
        self.session.delegate = self
        self.advertiser = MCNearbyServiceAdvertiser(peer: localPeerID, discoveryInfo: nil, serviceType: serviceType)
        self.browser = MCNearbyServiceBrowser(peer: localPeerID, serviceType: serviceType)
        self.advertiser.delegate = self
        self.browser.delegate = self
        self.browser.startBrowsingForPeers()
        
        self.homeViewController.newChatRoomButton.delegate = self
        self.homeViewController.allowUserView.delegate = self
        self.homeViewController.allowUserView.allowButton.delegate = self
        self.homeViewController.allowUserView.denyButton.delegate = self
        self.homeViewController.recentMessagesButton.delegate = self
        self.homeViewController.recentChatsView.delegate = self
        
    }
    
    func start() {
        add(childController: homeViewController)
    }
}

extension HomeFlowController: NewChatRoomViewDelegate {
    func didTapNewChatroom() {
        homeViewController.allowUserMode()
    }
}

extension HomeFlowController: CreateARoomViewDelegate {
    func didTapCloseCRV() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.allowUserView.removeFromSuperview()

    }

}


extension HomeFlowController: AllowButtonDelegate {
    func didTapAllow() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.allowUserView.removeFromSuperview()
        self.advertiser.startAdvertisingPeer()
    }
}

extension HomeFlowController: DenyButtonDelegate {
    func didTapDeny() {
        homeViewController.backgroundCover.removeFromSuperview()
        homeViewController.allowUserView.removeFromSuperview()
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


extension HomeFlowController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didReceiveInvitationFromPeer: \(peerID)")
        invitationHandler(true, self.session)
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        NSLog("%@", "didNotStartAdvetisingPeer: \(error)")
    }
}

extension HomeFlowController: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        NSLog("%@", "foundPeer: \(peerID)")
        NSLog("%@", "invitePeer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
        Pictochatr.knownUsers.append(peerID.displayName)
        self.homeViewController.newRequest()
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        NSLog("%@", "foundPeer: \(peerID)")
    }
}

extension HomeFlowController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        NSLog("%@", "peer \(peerID) didChangeState: \(state.rawValue)")
        Pictochatr.knownUsers.remove(at: )
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data)")
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }
    
    
    
}

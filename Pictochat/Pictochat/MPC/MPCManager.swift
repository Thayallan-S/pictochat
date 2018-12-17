//
//  MPCManager.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-15.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import MultipeerConnectivity
import UIKit
import Foundation
import Then

protocol MPCManagerDelegate {
    func connectedDevicesChanged(manager: MPCManager, connectedDevices: [String])
    func messageChanged(manager: MPCManager, message: String)
}

class MPCManager: NSObject {
    private let advertiser: MCNearbyServiceAdvertiser!
    private let browser: MCNearbyServiceBrowser!
    
    static let instance = MPCManager()
    
    var delegate: MPCManagerDelegate?
    
    let localPeerID: MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    let serviceType = "MPC-Testing"
    
    lazy var session: MCSession = {
        let session = MCSession(peer: localPeerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    override init() {
        self.advertiser = MCNearbyServiceAdvertiser(peer: localPeerID, discoveryInfo: nil, serviceType: serviceType)
        self.browser = MCNearbyServiceBrowser(peer: localPeerID, serviceType: serviceType)
        super.init()
        self.advertiser.delegate = self
        self.advertiser.startAdvertisingPeer()
        self.browser.delegate = self
        self.browser.startBrowsingForPeers()
    }
    deinit {
        self.advertiser.stopAdvertisingPeer()
        self.browser.startBrowsingForPeers()
    }
    
    func send(message: String) {
        NSLog("%@", "sendColor: \(message) to \(session.connectedPeers.count) peers")
        
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(message.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }
    }
    
}

extension MPCManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didReceiveInvitationFromPeer: \(peerID)")
        invitationHandler(true, self.session)

    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        NSLog("%@", "didNotStartAdvetisingPeer: \(error)")
    }
}

extension MPCManager: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        NSLog("%@", "foundPeer: \(peerID)")
        NSLog("%@", "invitePeer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)

    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        NSLog("%@", "foundPeer: \(peerID)")
    }
}

extension MPCManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        NSLog("%@", "peer \(peerID) didChangeState: \(state.rawValue)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices: session.connectedPeers.map{$0.displayName})
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data)")
        let str = String(data: data, encoding: .utf8)
        self.delegate?.messageChanged(manager: self, message: str!)
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

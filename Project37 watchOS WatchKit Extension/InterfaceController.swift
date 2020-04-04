//
//  InterfaceController.swift
//  Project37 watchOS WatchKit Extension
//
//  Created by Анастасия Стрекалова on 03.04.2020.
//  Copyright © 2020 Анастасия Стрекалова. All rights reserved.
//

import WatchConnectivity
import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var welcomeText: WKInterfaceLabel!
    @IBOutlet var hideButton: WKInterfaceButton!
    var winMode = false
        
    override func willActivate() {
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    @IBAction func hideWelcomeText() {
        welcomeText.setHidden(true)
        hideButton.setHidden(true)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        WKInterfaceDevice().play(.click)
    }
    @IBAction func winModeTapped() {
        if (WCSession.default.isReachable) {
            winMode.toggle()
            let message = ["winMode": winMode]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
        }
    }
}

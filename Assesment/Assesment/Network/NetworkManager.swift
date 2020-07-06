//
//  ViewController.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import Foundation
import Reachability

enum Status {
    case Connected
    case NotConnected
    case Unknown
}

class NetworkManager: NSObject {
    
    var reachability: Reachability?
    
    //Create Shared instance of the Class
    static let sharedInstance = NetworkManager()
    
    //Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus == .Connected
    }
    
    //Local Variable to help Check Network Connectivity
    var reachabilityStatus: Status = .Unknown

    //Private Intialiser
    override private init() {
        super.init()
        reachability = Reachability()
    }
    
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,selector: #selector(self.reachabilityChanged),name: Notification.Name.reachabilityChanged,object: reachability)
        do{
            try reachability?.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    /*
     @func: reachabilityChanged method for notification
     @param: notification of type Notification
     */
    @objc fileprivate func reachabilityChanged(notification: Notification) {
        if let reachability = notification.object as? Reachability {
            switch reachability.connection {
            case .cellular:
                reachabilityStatus = .Connected
            case .wifi:
                reachabilityStatus = .Connected
            case .none:
                reachabilityStatus = .NotConnected
            }
        }
    }
    
    
    
}

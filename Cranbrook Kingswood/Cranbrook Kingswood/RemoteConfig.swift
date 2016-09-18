//
//  RemoteConfig.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Firebase
import FirebaseRemoteConfig

class RemoteConfig {
    
    static let config = RemoteConfig()
    
    var remoteConfig: FIRRemoteConfig!
    
    internal func setupData() {
     
        //  Create Firebase defaults and make them accessible to the class
        createDefaults()
        
        //  Fetch remote config values from Firebase
        remoteConfig.fetchWithExpirationDuration(0) { (status, error) -> Void in
            if (status == FIRRemoteConfigFetchStatus.Success) {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
                
            } else {
                print("Config not fetched")
                print("Error \(error!.localizedDescription)")
            }
        }
        
    }
    
    private func createDefaults() {
        
        //  Instantiate the variable remoteConfig as an instance of Firebase remoteConfig
        remoteConfig = FIRRemoteConfig.remoteConfig()
        
        //  Enable developer mode. This ensure that the client side throttle is never reached and will allow data to be refreshed during development. Make sure this is set to false for production.
        // TODO: - Make developerModeEnabled true for production
        let remoteConfigSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
        
        //  Instantiate config settings of the remote config variable
        remoteConfig.configSettings = remoteConfigSettings!
        
        //  Point remote config to the plist containing the default values
        remoteConfig.setDefaultsFromPlistFileName("RemoteConfigDefaults")
        
    }
    
    internal func isAppAvailable() -> Bool {
        createDefaults()
        return self.remoteConfig["is_app_available"].boolValue
    }
    
}


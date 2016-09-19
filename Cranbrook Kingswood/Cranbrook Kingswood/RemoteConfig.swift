//
//  RemoteConfig.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

class RemoteConfig {
    
    static let config = RemoteConfig()
    
    internal func getRemoteData() {
        
        RMTConfig.startWithURL("https://docs.google.com/spreadsheets/d/1bMUl_zVnUxvrB8ch7Xv8k92IWFdtgGikdALR_8vt8KU/pub?output=csv")
        
    }
    
}


//
//  Reachability.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/29/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import SystemConfiguration
//
//public class Reachability {
//    
//    class func isConnectedToNetwork() -> Bool {
//        
//        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
//        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//        
//        guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
//            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
//        }) else {
//            return false
//        }
//        
//        var flags : SCNetworkReachabilityFlags = []
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
//            return false
//        }
//        
//        let isReachable = flags.contains(.Reachable)
//        let needsConnection = flags.contains(.ConnectionRequired)
//        
//        return (isReachable && !needsConnection)
//    }
//    
//}
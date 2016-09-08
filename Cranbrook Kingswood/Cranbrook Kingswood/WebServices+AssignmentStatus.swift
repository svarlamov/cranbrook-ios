//
//  WebServices+AssignmentStatus.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON
import SwiftMessages

enum AssingmentStatus: Int {
    case ToDo           = -1
    case inProgress     = 0
    case completed      = 1
}

extension WebServices {
    
    internal func UpdateAssignmentStatus(assignmentId assignmentId: String, toStatus status: AssingmentStatus, callBack: (isRequestSuccessful: Bool) -> Void) {
        
    }
    
    private func UpdateAssignmentStatusSubMethod(assignmentId: String, status: AssingmentStatus, callBack: (isRequestSuccessful: Bool) -> Void) {
        
    }
    
}



//
//  AssignmentDetailDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/30/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

//  MARK: - Assingment Detail Data Structure

struct AssignmentDetailDataStructure {
    var title:              String?
    var description:        String?
    var assignmentType:     String?
}

extension AssignmentDetailDataStructure: Unboxable {
    init(unboxer: Unboxer) {
        
        self.title              = unboxer.unbox("title")
        self.description        = unboxer.unbox("description")
        self.assignmentType     = unboxer.unbox("assignmentType")
        
        if let checkedDescription = self.title {
            
            let finalString: String = String(htmlEncodedString: checkedDescription)
            self.title = finalString
            
        }
        
        if let checkedDescription = self.description {
            
            let finalString: String = String(htmlEncodedString: checkedDescription)
            self.description = finalString
            
        }
        
    }
}


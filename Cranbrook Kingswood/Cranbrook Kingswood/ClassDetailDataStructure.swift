//
//  ClassDetailDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

// MARK: - structure for class detail list
struct CurrentUserClassDetail {
    var assignmentTypeId:               Int?
    var assignmentType:                 String?
    var percentage:                     String?
    var weight:                         Float?
    var assignmentId:                   Int?
    var assignment:                     String?
    var assignmentShortDescription:     String?
    var dateAssignedTicks:              Int?
    var dateAssigned:                   String?
    var dateDueTicks:                   Int?
    var dateDue:                        String?
    var scaleId:                        Int?
    var points:                         String?
    var maxPoints:                      Float?
    var sectionGrade:                   Float?
    var exemptTotal:                    Int?
    var incompleteTotal:                Int?
    var lateTotal:                      Int?
    var missingTotal:                   Int?
    var assignmentPercentage:           Float?
    var sectionGradeYear:               Float?
}

extension CurrentUserClassDetail: Unboxable {
    init(unboxer: Unboxer) {
        self.assignmentTypeId               = unboxer.unbox("AssignmentTypeId")
        self.assignmentType                 = unboxer.unbox("AssignmentType")
        self.percentage                     = unboxer.unbox("Percentage")
        self.weight                         = unboxer.unbox("Weight")
        self.assignmentId                   = unboxer.unbox("AssignmentId")
        self.assignment                     = unboxer.unbox("Assignment")
        self.assignmentShortDescription     = unboxer.unbox("AssignmentShortDescription")
        self.dateAssignedTicks              = unboxer.unbox("DateAssignedTicks")
        self.dateAssigned                   = unboxer.unbox("DateAssigned")
        self.dateDueTicks                   = unboxer.unbox("DateDueTicks")
        self.dateDue                        = unboxer.unbox("DateDue")
        self.scaleId                        = unboxer.unbox("ScaleId")
        self.points                         = unboxer.unbox("Points")
        self.maxPoints                      = unboxer.unbox("MaxPoints")
        self.sectionGrade                   = unboxer.unbox("SectionGrade")
        self.exemptTotal                    = unboxer.unbox("ExemptTotal")
        self.incompleteTotal                = unboxer.unbox("IncompleteTotal")
        self.lateTotal                      = unboxer.unbox("LateTotal")
        self.missingTotal                   = unboxer.unbox("MissingTotal")
        self.assignmentPercentage           = unboxer.unbox("AssignmentPercentage")
        self.sectionGradeYear               = unboxer.unbox("SectionGradeYear")
        
        if let checkedDescription = self.assignmentShortDescription {
            
            let parsedDescription: String = String(htmlEncodedString: checkedDescription)
            self.assignmentShortDescription = parsedDescription
            
        }
    }
}






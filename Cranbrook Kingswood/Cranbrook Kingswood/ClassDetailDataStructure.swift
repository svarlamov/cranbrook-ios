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
}

extension CurrentUserClassDetail: Unboxable {
    init(unboxer: Unboxer) {
    }
}

/*
 
"AssignmentTypeId":637,
 "AssignmentType":"Test",
 "Percentage":"95.28%",
 "Weight":50.0,
 "AssignmentId":5084259,
 "Assignment":"Ch 1 Test",
 "AssignmentShortDescription":"Chapter 1 Test",
 "DateAssignedTicks":635792544000000000,
 "DateAssigned":"10/1/2015 12:00 AM",
 "DateDueTicks":635793407400000000,
 "DateDue":"10/1/2015 11:59 PM",
 "ScaleId":null,
 "Points":"59",
 "MaxPoints":63.0,
 "AdditionalInfo":null,
 "SectionGrade":94.91,
 "ExemptTotal":0,
 "IncompleteTotal":0,
 "LateTotal":0,
 "MissingTotal":0,
 "AssignmentPercentage":93.65,
 "SectionGradeYear":93.61
 
*/
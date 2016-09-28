//
//  GroupParsedData.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/28/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

class GroupParsedData {
    static let groupParsedData: GroupParsedData = GroupParsedData()
    
    func groupClassGradeBookData(forData data: [CurrentUserClassDetail]?) -> [[CurrentUserClassDetail]]? {
        var gradeBookItemTypes: [String] = [String]()
        var returnData: [[CurrentUserClassDetail]] = [[CurrentUserClassDetail]]()
        var appendedItemList: [CurrentUserClassDetail] = [CurrentUserClassDetail]()
        
        for gradeBookItem in data! {
            if let type = gradeBookItem.assignmentType {
                if gradeBookItemTypes.contains(type) {} else {
                    gradeBookItemTypes.append(type)
                }
            }
        }
        
        for checkedType in gradeBookItemTypes {
            for gradeBookItem in data! {
                if let type = gradeBookItem.assignmentType {
                    if type == checkedType {
                        appendedItemList.append(gradeBookItem)
                    }
                }
            }
            returnData.append(appendedItemList)
            appendedItemList.removeAll()
        }
        
        return returnData
    }
}

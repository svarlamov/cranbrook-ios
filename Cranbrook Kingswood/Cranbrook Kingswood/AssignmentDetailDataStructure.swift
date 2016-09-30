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
            
            var finalString: String = String()
            var editedString: String = checkedDescription
            
            if checkedDescription.rangeOfString("<div>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<div>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</div>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</div>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("&#160;") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("&#160;", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<br>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<br />") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<br />", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</b>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</b>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<b>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<b>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<i>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<i>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</i") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</i>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("\\") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("\\", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            finalString = editedString
            self.title = finalString
            
        }
        
        if let checkedDescription = self.description {
            
            var finalString: String = String()
            var editedString: String = checkedDescription
            
            if checkedDescription.rangeOfString("<div>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<div>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("\\") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("\\", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</div>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</div>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("&#160;") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("&#160;", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<br>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<br />") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<br />", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</b>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</b>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<b>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<b>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("<i>") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("<i>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            if checkedDescription.rangeOfString("</i") != nil {
                editedString = editedString.stringByReplacingOccurrencesOfString("</i>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
            
            finalString = editedString
            self.description = finalString
            
        }
        
    }
}


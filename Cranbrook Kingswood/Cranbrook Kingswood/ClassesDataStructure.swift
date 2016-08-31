//
//  ClassesDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

//  https://cranbrook.myschoolapp.com/api/datadirect/ParentStudentUserAcademicGroupsGet?userId=3254976&schoolYearLabel=2016+-+2017&memberLevel=3&persona=2&durationList=66106&markingPeriodId=

// MARK: - structure for class list
struct CurrentUserClasses {
	var albumId:                    Int?
	var durationId:                 Int?
	var filePath:                   String?
	var ownerId:                    Int?
	var assignmentActiveToday:      Int?
    var assignmentAssignedToday:    Int?
	var assignmentDueToday:         Int?
	var canViewAssignments:         Bool?
	var courseDescription:          String?
	var cumGrade:                   String?
	var currentTerm:                String?
	var gradeBookCumGpa:            Bool?
	var groupOwnerEmail:            String?
	var groupOwnerName:             String?
	var groupOwnerPhoto:            String?
	var leadSectionId:              Int?
    var markingPeriodId:            Int?
	var mostRecentGroupPhoto:       String?
	var publishGroupToUser:         Bool?
	var room:                       String?
	var schoolLevel:                String?
	var sectionId:                  Int?
	var sectionIdentifier:          String?
}

extension CurrentUserClasses: Unboxable {
	init(unboxer: Unboxer) {
		self.albumId                    = unboxer.unbox("AlbumId")
		self.durationId                 = unboxer.unbox("DurationId")
		self.filePath                   = unboxer.unbox("FilePath")
		self.ownerId                    = unboxer.unbox("OwnerId")
		self.assignmentActiveToday      = unboxer.unbox("assignmentactivetoday")
        self.assignmentAssignedToday    = unboxer.unbox("assignmentassignedtoday")
		self.assignmentDueToday         = unboxer.unbox("assignmentduetoday")
		self.canViewAssignments         = unboxer.unbox("canviewassignments")
		self.courseDescription          = unboxer.unbox("coursedescription")
		self.cumGrade                   = unboxer.unbox("cumgrade")
		self.currentTerm                = unboxer.unbox("currentterm")
		self.gradeBookCumGpa            = unboxer.unbox("gradebookcumgpa")
		self.groupOwnerEmail            = unboxer.unbox("groupowneremail")
		self.groupOwnerName             = unboxer.unbox("groupownername")
		self.groupOwnerPhoto            = unboxer.unbox("groupownerphoto")
		self.leadSectionId              = unboxer.unbox("leadsectionid")
        self.markingPeriodId            = unboxer.unbox("markingperiodid")
		self.mostRecentGroupPhoto       = unboxer.unbox("mostrecentgroupphoto")
		self.publishGroupToUser         = unboxer.unbox("publishgrouptouser")
		self.room                       = unboxer.unbox("room")
		self.schoolLevel                = unboxer.unbox("schoollevel")
		self.sectionId                  = unboxer.unbox("sectionid")
		self.sectionIdentifier          = unboxer.unbox("sectionidentifier")

	}
}



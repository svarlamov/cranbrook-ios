//
//  DataModels.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

// MARK: - structure for current student session info
struct CurrentLoggedInUserInfo {
    var userId: String
    var sessionToken: String
    
    init(userId: String, sessionToken: String) {
        self.userId = userId
        self.sessionToken = sessionToken
    }
}

// MARK: - structure for user login info
struct UserLoginInfoStructure {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}

// MARK: - structure for individual search result elements
struct SearchResultResponse: Mappable {
	var userId: Int?
	var suffic: String?
	var firstName: String?
	var middleName: String?
	var lastName: String?
	var publishUserProfile: String?
	var largeFileName: String?
	var profileImage: UIImage?
	var email: String?
	var emailBad: Bool?
	var publishEmail: Bool?
	var addressLine1: String?
	var city: String?
	var state: String?
	var zip: String?
	var homePhone: String?
	var cellPhone: String?
	var officePhone: String?
	var myContactsId: Int?
	var hasRelationships: Bool?
	var gradYear: String?
	var grade: String?
	var gradeDisplay: String?
	var department: String?
	var departmentDisplay: String?
	var spouseId: Int?
	var gradeNumeric: Int?
	var gradeNumericDisplay: String?
	var totalCount: Int?
	var deceased: Bool?
	var isStudentInd: Bool?
	var preferredAddressId: Int?
	var preferredAddressLat: Int?
	var preferredAddressLng: Int?
	
	init?(_ map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		userId <- map["UserID"]
		suffic <- map["UserID"]
		firstName <- map["UserID"]
		middleName <- map["UserID"]
		lastName <- map["UserID"]
		publishUserProfile <- map["UserID"]
		largeFileName <- map["UserID"]
		email <- map["UserID"]
		emailBad <- map["UserID"]
		publishEmail <- map["UserID"]
		addressLine1 <- map["UserID"]
		city <- map["UserID"]
		state <- map["UserID"]
		zip <- map["UserID"]
		homePhone <- map["UserID"]
		cellPhone <- map["UserID"]
		officePhone <- map["UserID"]
		myContactsId <- map["UserID"]
		hasRelationships <- map["UserID"]
		gradYear <- map["UserID"]
		grade <- map["UserID"]
		gradeDisplay <- map["UserID"]
		department <- map["UserID"]
		departmentDisplay <- map["UserID"]
		spouseId <- map["UserID"]
		gradeNumeric <- map["UserID"]
		gradeNumericDisplay <- map["UserID"]
		totalCount <- map["UserID"]
		deceased <- map["UserID"]
		isStudentInd <- map["UserID"]
		preferredAddressId <- map["UserID"]
		preferredAddressLat <- map["UserID"]
		preferredAddressLng <- map["UserID"]
		
	}
	
}


// MARK: - structure for class list
struct CurrentUserClasses: Mappable {
    var albumId: Int?
    var durationId: Int?
    var filePath: String?
    var ownerId: Int?
    var assignmentActiveToday: Int?
    var assignmentAssignedToday: Int?
    var assignmentDueToday: Int?
    var canViewAssignments: Bool?
    var courseDescription: String?
    var cumGrade: String?
    var currentTerm: String?
    var gradeBookCumGpa: Bool?
    var groupOwnerEmail: String?
    var groupOwnerName: String?
    var groupOwnerPhoto: String?
    var leadSectionId: Int?
    var markingPeriodId: Int?
    var mostRecentGroupPhoto: String?
    var publishGroupToUser: Bool?
    var room: String?
    var schoolLevel: String?
    var sectionId: Int?
    var sectionIdentifier: String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        albumId <- map["AlbumId"]
        durationId <- map["DurationId"]
        filePath <- map["FilePath"]
        ownerId <- map["OwnerId"]
        assignmentActiveToday <- map["assignmentactivetoday"]
        assignmentAssignedToday <- map["assignmentassignedtoday"]
        assignmentDueToday <- map["assignmentduetoday"]
        canViewAssignments <- map["canviewassignments"]
        courseDescription <- map["coursedescription"]
        cumGrade <- map["cumgrade"]
        currentTerm <- map["currentterm"]
        gradeBookCumGpa <- map["gradebookcumgpa"]
        groupOwnerEmail <- map["groupowneremail"]
        groupOwnerName <- map["groupownername"]
        groupOwnerPhoto <- map["groupownerphoto"]
        leadSectionId <- map["leadsectionid"]
        markingPeriodId <- map["markingperiodid"]
        mostRecentGroupPhoto <- map["mostrecentgroupphoto"]
        publishGroupToUser <- map["publishgrouptouser"]
        room <- map["room"]
        schoolLevel <- map["schoollevel"]
        sectionId <- map["sectionid"]
        sectionIdentifier <- map["sectionidentifier"]
    }
}


















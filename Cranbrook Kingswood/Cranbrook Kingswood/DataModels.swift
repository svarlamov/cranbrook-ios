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


















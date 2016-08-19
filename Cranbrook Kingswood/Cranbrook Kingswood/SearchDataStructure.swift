//
//  SearchDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

// MARK: - structure for individual search result elements
struct SearchResultResponse {
	var userId:                 Int?
	var suffix:                 String?
	var firstName:              String?
	var middleName:             String?
	var lastName:               String?
	var publishUserProfile:     String?
	var largeFileName:          String?
	var profileImage:           UIImage?
	var email:                  String?
    var emailBad:               Bool?
	var publishEmail:           Bool?
	var addressLine1:           String?
	var addressLine2:           String?
	var city:                   String?
	var state:                  String?
    var zip:                    String?
	var homePhone:              String?
	var cellPhone:              String?
    var officePhone:            String?
    var myContactsId:           Int?
	var hasRelationships:       Bool?
	var gradYear:               String?
	var grade:                  String?
	var gradeDisplay:           String?
	var department:             String?
	var departmentDisplay:      String?
	var spouseId:               Int?
	var gradeNumeric:           Int?
	var gradeNumericDisplay:    String?
	var totalCount:             Int?
	var deceased:               Bool?
	var isStudentInd:           Bool?
	var preferredAddressId:     Int?
    var preferredAddressLat:    Int?
	var preferredAddressLng:    Int?
	
}

extension SearchResultResponse: Unboxable {
	init(unboxer: Unboxer) {
		self.userId                 = unboxer.unbox("UserID")
		self.suffix                 = unboxer.unbox("Suffix")
		self.firstName              = unboxer.unbox("FirstName")
		self.middleName             = unboxer.unbox("Middlename")
		self.lastName               = unboxer.unbox("LastName")
		self.publishUserProfile     = unboxer.unbox("PublishUserProfile")
		self.largeFileName          = unboxer.unbox("LargeFileName")
		self.email                  = unboxer.unbox("Email")
        self.emailBad               = unboxer.unbox("EmailBad")
		self.publishEmail           = unboxer.unbox("PublishEmail")
		self.addressLine1           = unboxer.unbox("AddressLine1")
		self.addressLine2           = unboxer.unbox("AddressLine2")
		self.city                   = unboxer.unbox("City")
		self.state                  = unboxer.unbox("State")
        self.zip                    = unboxer.unbox("Zip")
		self.homePhone              = unboxer.unbox("HomePhone")
		self.cellPhone              = unboxer.unbox("CellPhone")
        self.officePhone            = unboxer.unbox("OfficePhone")
        self.myContactsId           = unboxer.unbox("MyContactsID")
		self.hasRelationships       = unboxer.unbox("HasRelationships")
		self.gradYear               = unboxer.unbox("GradYear")
		self.grade                  = unboxer.unbox("Grade")
		self.gradeDisplay           = unboxer.unbox("GradeDisplay")
		self.department             = unboxer.unbox("Department")
		self.departmentDisplay      = unboxer.unbox("DepartmentDisplay")
		self.spouseId               = unboxer.unbox("SpouseID")
		self.gradeNumeric           = unboxer.unbox("GradeNumeric")
		self.gradeNumericDisplay    = unboxer.unbox("GradeNumericDisplay")
		self.totalCount             = unboxer.unbox("TotalCount")
		self.deceased               = unboxer.unbox("Deceased")
		self.isStudentInd           = unboxer.unbox("IsStudentInd")
		self.preferredAddressId     = unboxer.unbox("PreferredAddressId")
		self.preferredAddressLat    = unboxer.unbox("PreferredAddressLat")
		self.preferredAddressLng    = unboxer.unbox("PreferredAddressLng")
	}
}







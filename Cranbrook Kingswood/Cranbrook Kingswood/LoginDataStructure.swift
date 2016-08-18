//
//  LoginDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

// MARK: - structure for current student session info
struct CurrentLoggedInUserInfo {
	var userId:			String
	var sessionToken:	String
	
	init(userId: String, sessionToken: String) {
		self.userId			= userId
		self.sessionToken	= sessionToken
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
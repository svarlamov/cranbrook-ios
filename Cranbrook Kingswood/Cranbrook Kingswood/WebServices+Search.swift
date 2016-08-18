//
//  WebServices+Search.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

enum SearchDirectories: String {
	case Alumni = "41"
	case Students = "449"
	case Faculty = "177"
}

extension WebServices {
	
	internal func searchDirectory(query query: String, directory: SearchDirectories, callBack: (isLoginSuccessful: Bool) -> Void) {
		let searchRequestUrl: String = searchUrlForDirectorySearch(query, directory: directory)
		let searchDirectoryRequest: NSMutableURLRequest = createSearchRequestWithUrl(searchRequestUrl)
		
		Alamofire.request(searchDirectoryRequest).responseJSON { response in
			
			if let loginResponse: JSON = JSON(response.result.value!) {
				
				
			}
			
		}
		
	}
	
	private func createSearchRequestWithUrl(stringUrl: String) -> NSMutableURLRequest {
		let requestUrl = NSURL(string: stringUrl)!
		let request = NSMutableURLRequest(URL: requestUrl)
		request.HTTPMethod = "GET"
		if let sessionToken = currentSessionInfo?.sessionToken {
			request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
		}
		return request
	}
	
	private func searchUrlForDirectorySearch(query: String, directory: SearchDirectories) -> String {
		let searchString = query.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
		return "https://cranbrook.myschoolapp.com/api/directory/directoryresultsget?directoryId=\(directory.rawValue)&searchVal=\(searchString)&facets=&searchAll=false"
	}
	
}
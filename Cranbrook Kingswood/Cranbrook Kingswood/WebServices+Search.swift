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
import Unbox

enum SearchDirectories: String {
	case Alumni     = "41"
	case Students   = "449"
	case Faculty    = "177"
}

extension WebServices {
	
	internal func searchDirectory(query query: String, directory: SearchDirectories, callBack: (searchResponse: [SearchResultResponse]?) -> Void) {
        Analytics.analytics.logSearch(query)
		let searchRequestUrl: String = searchUrlForDirectorySearch(query, directory: directory)
		let searchDirectoryRequest: NSMutableURLRequest = createSearchRequestWithUrl(searchRequestUrl)
        
		Alamofire.request(searchDirectoryRequest).responseJSON { response in
			if let searchQueryResponse: JSON = JSON(response.result.value!) {
				let searchResponseDictionary: NSArray = searchQueryResponse.rawValue as! NSArray
				var returnSearchResultArray: [SearchResultResponse] = [SearchResultResponse]()
				
				for singularSearchResponseElement in searchResponseDictionary {
					let singularResponse: NSDictionary = singularSearchResponseElement as! NSDictionary
					let searchResult: SearchResultResponse? = self.mapDirectorySearchResult(singularResponse)
					returnSearchResultArray.append(searchResult!)
					
				}
				callBack(searchResponse: returnSearchResultArray)
				
			}
			
		}
		
	}
	
	private func addSingularSearchResultToArray(result: SearchResultResponse?) {
		searchResults?.append(result!)
	}
	
	private func mapDirectorySearchResult(responseObject: NSDictionary) -> SearchResultResponse? {
		do {
			let responseElement: SearchResultResponse = try Unbox(responseObject as! UnboxableDictionary)
			return responseElement
		} catch {}
		return nil;
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
        let instanceEndpoint: String = endpointPath(searchEndpoint)
		let searchString = query.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
		return "\(instanceEndpoint)\(directory.rawValue)&searchVal=\(searchString)&facets=&searchAll=false"
	}
	
}

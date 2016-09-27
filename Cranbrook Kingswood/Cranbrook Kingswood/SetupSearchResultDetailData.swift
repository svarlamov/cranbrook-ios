
//
//  SetupSearchResultDetailDat.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/27/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

struct SearchDetailDataStructure {
    var headerLabelText: String
    var subTitleLabelText: String
    var phoneNumberOneText: String
    var phoneNumberTwoText: String
    var addressText: String
    
    init (headerLabelText: String, subTitleLabelText: String, phoneNumberOneText: String, phoneNumberTwoText: String, addressText: String) {
        self.headerLabelText = headerLabelText
        self.subTitleLabelText = subTitleLabelText
        self.phoneNumberOneText = phoneNumberOneText
        self.phoneNumberTwoText = phoneNumberTwoText
        self.addressText = addressText
    }
    
}

extension DirectorySearchViewController {
    
    internal func setupDetailViewData() -> SearchDetailDataStructure {
        let dataToParse: SearchResultResponse? = selectedSearchResult
        var headerLabelText: String = ""
        var subTitleLabelText: String = ""
        var phoneNumberOneText: String = ""
        var phoneNumberTwoText: String = ""
        var addressText: String = ""
        
    }
    
}

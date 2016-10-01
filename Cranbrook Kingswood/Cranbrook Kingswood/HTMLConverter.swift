//
//  HTMLConverter.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 10/1/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

extension String {
    
    init(htmlEncodedString: String) {
        let htmlString = htmlEncodedString
        if let htmldata = htmlString.dataUsingEncoding(NSUTF8StringEncoding), let attributedString = try? NSAttributedString(data: htmldata, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil) {
            let finalString = attributedString.string
            self.init(finalString)
        } else {
            self.init("ERROR: parsing_failed")
        }
    }
    
}

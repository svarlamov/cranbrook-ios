//
//  SearchResultDetailView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/16/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class SearchResultDetailView: UIView {
    
    var searchItem: SearchResultResponse = SearchResultResponse()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

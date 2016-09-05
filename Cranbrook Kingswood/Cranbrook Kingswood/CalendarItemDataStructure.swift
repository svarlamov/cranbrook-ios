//
//  CalendarItemDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/3/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

struct CalendarItemDataStructure {
    var endDate:    String?
    var startDate:  String?
    var title:      String?
}

extension CalendarItemDataStructure: Unboxable {
    init(unboxer: Unboxer) {
        self.endDate =      unboxer.unbox("EndDate")
        self.startDate =    unboxer.unbox("StartDate")
        self.title =        unboxer.unbox("Title")
    }
}

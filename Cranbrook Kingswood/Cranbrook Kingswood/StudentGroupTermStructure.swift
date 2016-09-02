//
//  StudentGroupTermStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/31/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

struct StudentGroupTermStructure {
    var offeringType:           Int?
    var durationId:             Int?
    var durationDescription:    String?
    var currendInd:             Int?
}

extension StudentGroupTermStructure: Unboxable {
    init(unboxer: Unboxer) {
        self.offeringType           = unboxer.unbox("OfferingType")
        self.durationId             = unboxer.unbox("DurationId")
        self.durationDescription    = unboxer.unbox("DurationDescription")
        self.currendInd             = unboxer.unbox("CurrentInd")
    }
}

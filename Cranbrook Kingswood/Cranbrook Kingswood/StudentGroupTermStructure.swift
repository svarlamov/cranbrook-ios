//
//  StudentGroupTermStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/31/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

//  https://cranbrook.myschoolapp.com/api/DataDirect/StudentGroupTermList/?studentUserId=3254976&schoolYearLabel=2016+-+2017&personaId=2

struct StudentGroupTermList {
    var offeringType:           Int?
    var durationId:             Int?
    var durationDescription:    String?
    var currendInd:             Int?
}

extension StudentGroupTermList: Unboxable {
    init(unboxer: Unboxer) {
        self.offeringType           = unboxer.unbox("OfferingType")
        self.durationId             = unboxer.unbox("DurationId")
        self.durationDescription    = unboxer.unbox("DurationDescription")
        self.currendInd             = unboxer.unbox("CurrentInd")
    }
}

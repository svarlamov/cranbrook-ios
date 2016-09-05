//
//  AssignmentDataStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/2/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox

//  TODO: - TaskList: 1

//  MARK: - structure for singular assignment
struct AssignmentDataStructure {
    var allowDiscussionAttachment:      Bool?
    var assessmentInd:                  Bool?
    var assessmentLocked:               Bool?
    var assignmentId:                   Int?
    var assignmentIndexId:              Int?
    var assignmentStatus:               Int?
    var assignmentType:                 String?
    var dateAssigned:                   String?
    var dateAssignedTicks:              Int?
    var dateDue:                        String?
    var dateDueTicks:                   Int?
    var discussionInd:                  Bool?
    var dropBoxInd:                     Bool?
    var dropBoxLateTime:                String?
    var dropBoxLateTimeTicks:           Int?
    var enrollCount:                    Int?
    var gradedCount:                    Int?
    var groupName:                      String?
    var hasDownload:                    Bool?
    var hasGrade:                       Bool?
    var hasLink:                        Bool?
    var incGradeBook:                   Bool?
    var localNow:                       String?
    var localNowTicks:                  Int?
    var longDescription:                String?
    var ltiConfigInd:                   Bool?
    var ltiInd:                         Bool?
    var ltiProviderName:                String?
    var major:                          Bool?
    var publishGrade:                   Bool?
    var sectionId:                      Int?
    var shareDiscussion:                Bool?
    var shortDescription:               String?
    var showDiscussionInd:              Bool?
}

extension AssignmentDataStructure: Unboxable {
    init(unboxer: Unboxer) {
        self.allowDiscussionAttachment       = unboxer.unbox("allow_discussion_attachment")
        self.assessmentInd                   = unboxer.unbox("assessment_ind")
        self.assessmentLocked                = unboxer.unbox("assessment_locked")
        self.assignmentId                    = unboxer.unbox("assignment_id")
        self.assignmentIndexId               = unboxer.unbox("assignment_index_id")
        self.assignmentStatus                = unboxer.unbox("assignment_status")
        self.assignmentType                  = unboxer.unbox("assignment_type")
        self.dateAssigned                    = unboxer.unbox("date_assigned")
        self.dateAssignedTicks               = unboxer.unbox("date_assignedTicks")
        self.dateDue                         = unboxer.unbox("date_due")
        self.dateDueTicks                    = unboxer.unbox("date_dueTicks")
        self.discussionInd                   = unboxer.unbox("discussion_ind")
        self.dropBoxInd                      = unboxer.unbox("drop_box_ind")
        self.dropBoxLateTime                 = unboxer.unbox("drop_box_late_time")
        self.dropBoxLateTimeTicks            = unboxer.unbox("drop_box_late_timeTicks")
        self.enrollCount                     = unboxer.unbox("enroll_count")
        self.gradedCount                     = unboxer.unbox("graded_count")
        self.groupName                       = unboxer.unbox("groupname")
        self.hasDownload                     = unboxer.unbox("has_download")
        self.hasGrade                        = unboxer.unbox("has_grade")
        self.hasLink                         = unboxer.unbox("has_link")
        self.incGradeBook                    = unboxer.unbox("inc_grade_book")
        self.localNow                        = unboxer.unbox("local_now")
        self.localNowTicks                   = unboxer.unbox("local_nowTicks")
        self.longDescription                 = unboxer.unbox("long_description")
        self.ltiConfigInd                    = unboxer.unbox("lti_config_ind")
        self.ltiInd                          = unboxer.unbox("lti_ind")
        self.ltiProviderName                 = unboxer.unbox("lti_provider_name")
        self.major                           = unboxer.unbox("major")
        self.publishGrade                    = unboxer.unbox("publish_grade")
        self.sectionId                       = unboxer.unbox("section_id")
        self.shareDiscussion                 = unboxer.unbox("share_discussion")
        self.shortDescription                = unboxer.unbox("short_description")
        self.showDiscussionInd               = unboxer.unbox("show_discussion_ind")
    }
}


















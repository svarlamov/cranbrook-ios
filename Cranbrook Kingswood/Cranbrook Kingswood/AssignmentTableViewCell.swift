//
//  AssignmentTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class AssignmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: ShadowView!
    @IBOutlet weak var assignmentTitleLabel: UILabel!
    @IBOutlet weak var assignmentClassLabel: UILabel!
    @IBOutlet weak var assignmentTypeLabel: UILabel!
    @IBOutlet weak var toDoButton: UIButton!
    @IBOutlet weak var inProgressButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    
    var cellAssignmentId: String = String()
    var assignmentIndexPath: Int = Int()
    var assignmentStatus: Int? = Int()
    
    let blueColor: UIColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViewCorner()
    }
    
    private func setupViewCorner() {
        self.cellContentView.layer.cornerRadius = 0.5
        self.cellContentView.layer.masksToBounds = false
    }
    
    func changeStatusButtons(toStatus status: Int) {
        self.toDoButton.layer.cornerRadius = 5
        self.inProgressButton.layer.cornerRadius = 5
        self.completedButton.layer.cornerRadius = 5
        if status == 1 {
            self.completedButton.backgroundColor = UIColor.clearColor()
            self.completedButton.layer.borderWidth = 2
            self.completedButton.layer.borderColor = blueColor.CGColor
            self.completedButton.setTitleColor(blueColor, forState: .Normal)
            
            self.toDoButton.backgroundColor = blueColor
            self.toDoButton.layer.borderWidth = 2
            self.toDoButton.layer.borderColor = blueColor.CGColor
            self.toDoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            self.inProgressButton.backgroundColor = blueColor
            self.inProgressButton.layer.borderWidth = 2
            self.inProgressButton.layer.borderColor = blueColor.CGColor
            self.inProgressButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
        } else if status == -1 {
            self.toDoButton.backgroundColor = UIColor.clearColor()
            self.toDoButton.layer.borderWidth = 2
            self.toDoButton.layer.borderColor = blueColor.CGColor
            self.toDoButton.setTitleColor(blueColor, forState: .Normal)
            
            self.inProgressButton.backgroundColor = blueColor
            self.inProgressButton.layer.borderWidth = 2
            self.inProgressButton.layer.borderColor = blueColor.CGColor
            self.inProgressButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            self.completedButton.backgroundColor = blueColor
            self.completedButton.layer.borderWidth = 2
            self.completedButton.layer.borderColor = blueColor.CGColor
            self.completedButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
        } else if status == 0 {
            self.inProgressButton.backgroundColor = UIColor.clearColor()
            self.inProgressButton.layer.borderWidth = 2
            self.inProgressButton.layer.borderColor = blueColor.CGColor
            self.inProgressButton.setTitleColor(blueColor, forState: .Normal)
            
            self.toDoButton.backgroundColor = blueColor
            self.toDoButton.layer.borderWidth = 2
            self.toDoButton.layer.borderColor = blueColor.CGColor
            self.toDoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            self.completedButton.backgroundColor = blueColor
            self.completedButton.layer.borderWidth = 2
            self.completedButton.layer.borderColor = blueColor.CGColor
            self.completedButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
        }
    }
    
    func removeVisualButtonChanges() {
        self.inProgressButton.backgroundColor = blueColor
        self.inProgressButton.layer.borderWidth = 2
        self.inProgressButton.layer.borderColor = blueColor.CGColor
        self.inProgressButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        self.toDoButton.backgroundColor = blueColor
        self.toDoButton.layer.borderWidth = 2
        self.toDoButton.layer.borderColor = blueColor.CGColor
        self.toDoButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        self.completedButton.backgroundColor = blueColor
        self.completedButton.layer.borderWidth = 2
        self.completedButton.layer.borderColor = blueColor.CGColor
        self.completedButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    @IBAction func toDoButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .ToDo)
        self.changeStatusButtons(toStatus: -1)
    }
    
    @IBAction func inProgressButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .inProgress)
        self.changeStatusButtons(toStatus: 0)
    }
    
    @IBAction func completedButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .completed)
        self.changeStatusButtons(toStatus: 1)
    }
    
    private func changeAssignmentForStatusAtIndex(status status: Int) {
        for assignment in specificDateAssignments! {
            if let instanceId = assignment.assignmentIndexId {
                if String(instanceId) == self.cellAssignmentId {
                    
                }
            }
        }
    }
    
    func changeAssignmentStatus(toStatus status: AssingmentStatus) {
        WebServices.service.UpdateAssignmentStatus(assignmentId: cellAssignmentId, toStatus: status) { (isRequestSuccessful) in
            self.changeAssignmentForStatusAtIndex(status: status.rawValue)
        }
    }
    
}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundButtons()
        self.setupViewCorner()
    }
    
    private func setupViewCorner() {
        self.cellContentView.layer.cornerRadius = 0.5
        self.cellContentView.layer.masksToBounds = true
    }
    
    private func roundButtons() {
        self.toDoButton.layer.cornerRadius = 1
        self.inProgressButton.layer.cornerRadius = 1
        self.completedButton.layer.cornerRadius = 1
    }
    
    @IBAction func toDoButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .ToDo)
    }
    
    @IBAction func inProgressButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .inProgress)
    }
    
    @IBAction func completedButtonPressed(sender: UIButton) {
        changeAssignmentStatus(toStatus: .completed)
    }
    
    func changeAssignmentStatus(toStatus status: AssingmentStatus) {
        WebServices.service.UpdateAssignmentStatus(assignmentId: cellAssignmentId, toStatus: status) { (isRequestSuccessful) in
            if isRequestSuccessful {
                print("awesome")
            }
        }
    }
    
}

//
//  ClassesTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
         [v.layer setShadowColor:[UIColor blackColor].CGColor];
         [v.layer setShadowOpacity:0.8];
         [v.layer setShadowRadius:3.0];
         [v.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
 */
        self.cellContentView.layer.shadowColor = UIColor.blackColor().CGColor
        self.cellContentView.layer.shadowOpacity = 0.8
        self.cellContentView.layer.shadowRadius = 3.0
        self.cellContentView.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        setupViews()
    }
    
    func setupViews() {
        roundCellContentViewCorners()
    }
    
    func roundCellContentViewCorners() {
        self.cellContentView.layer.cornerRadius = 1
        self.cellContentView.layer.masksToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

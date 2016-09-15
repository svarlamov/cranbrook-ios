//
//  ClassesTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import QuartzCore

class ClassesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

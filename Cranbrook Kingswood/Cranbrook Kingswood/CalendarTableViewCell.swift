//
//  CalendarTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/4/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

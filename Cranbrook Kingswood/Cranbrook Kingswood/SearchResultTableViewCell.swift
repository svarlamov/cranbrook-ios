//
//  SearchResultTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/19/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellContentView.layer.shadowColor = UIColor.blackColor().CGColor
        self.cellContentView.layer.shadowOffset = CGSizeMake(0, 2)
        self.cellContentView.layer.shadowOpacity = 0.30
        self.cellContentView.layer.shadowRadius = 1.0
        setupViews()
    }
    
    func setupViews() {
        roundCellContentViewCorners()
        roundImageView()
    }
    
    func roundImageView() {
        self.profileImageView.layer.borderWidth = 1
        self.profileImageView.layer.masksToBounds = false
        self.profileImageView.layer.borderColor = UIColor.clearColor().CGColor
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
        self.profileImageView.clipsToBounds = true
    }
    
    func roundCellContentViewCorners() {
        self.cellContentView.layer.cornerRadius = 3
        self.cellContentView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

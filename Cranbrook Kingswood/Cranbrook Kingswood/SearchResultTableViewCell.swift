//
//  SearchResultTableViewCell.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/19/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: ShadowView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var mainProfileImage: UIImageView!
    @IBOutlet weak var imageHolder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        self.roundImageView()
        self.roundMainImageView()
    }
    
    func roundImageHolder() {
        self.imageHolder.layer.cornerRadius = self.mainProfileImage.frame.height/2
        self.imageHolder.layer.masksToBounds = true
        self.imageHolder.clipsToBounds = true
    }
    
    func roundMainImageView() {
        self.mainProfileImage.layer.cornerRadius = self.mainProfileImage.frame.height/2
    }
    
    func roundImageView() {
        self.profileImageView.layer.borderWidth = 1
        self.profileImageView.layer.masksToBounds = false
        self.profileImageView.layer.borderColor = UIColor.clearColor().CGColor
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
        self.profileImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

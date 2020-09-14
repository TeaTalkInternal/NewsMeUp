//
//  NewsTableViewCell.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var thumbnailImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addAccessibiltyForElements()
    }
    
    //Mainly to access the elements in UI Testing
    func addAccessibiltyForElements() -> Void {
        titleLabel.isAccessibilityElement = true
        descriptionLabel.isAccessibilityElement = true
        thumbnailImageView.isAccessibilityElement = true
        
        titleLabel.accessibilityIdentifier = "titleLabel"
        descriptionLabel.accessibilityIdentifier = "descriptionLabel"
        thumbnailImageView.accessibilityIdentifier = "thumbnailImageView"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

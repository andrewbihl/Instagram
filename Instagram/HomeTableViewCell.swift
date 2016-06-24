//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by joy on 6/23/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descript: UILabel!
    
    
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        [self.cardSetup]
        [self.imageSetup]
    }
    
    
    func cardSetup () {
        cardView.layer.masksToBounds = false;
        cardView.layer.cornerRadius = 1;
        cardView.layer.shadowOffset = CGSizeMake(-2, 2)
        cardView.layer.shadowRadius = 1;
        let path = UIBezierPath(rect: self.cardView.bounds)
        cardView.layer.shadowPath = path.CGPath;
        cardView.layer.shadowOpacity = 0.2;
    }
    
    func imageSetup () {
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true;
        profileImage.contentMode = UIViewContentMode.ScaleAspectFit
        profileImage.backgroundColor = UIColor.whiteColor()
    }
    
    
    
    
}

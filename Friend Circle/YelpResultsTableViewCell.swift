//
//  YelpResultsTableViewCell.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/24/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class YelpResultsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeRatingImageView: UIImageView!
    @IBOutlet weak var placeDistanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

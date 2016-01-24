//
//  PersonStatusTableViewCell.swift
//  Friend Circle
//
//  Created by Bryan Rivera on 1/24/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class PersonStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var PersonPic: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personStatusLabel: UILabel!
    @IBOutlet weak var personNeedRide: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  OptionsTableViewCell.swift
//  Friend Circle
//
//  Created by Bryan Rivera on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var OptionsCell: UILabel!
    
    @IBOutlet weak var optionsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

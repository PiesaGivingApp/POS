//
//  CurrentStatusTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class CurrentStatusTableViewCell: UITableViewCell {
        
    @IBOutlet var statusImage: UIImageView!
    @IBOutlet var statusNameLabel: UILabel!
    @IBOutlet var viewButton: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

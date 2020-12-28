//
//  ColckedOutTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 13/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ColckedOutTableViewCell: UITableViewCell {
    
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet weak var in_out_Lble: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

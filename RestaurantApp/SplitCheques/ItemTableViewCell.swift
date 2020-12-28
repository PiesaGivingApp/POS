//
//  ItemTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 02/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var subItemNameLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

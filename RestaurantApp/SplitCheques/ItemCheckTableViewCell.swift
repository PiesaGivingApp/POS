//
//  ItemCheckTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 02/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ItemCheckTableViewCell: UITableViewCell {
    
    
    @IBOutlet var backView: UIView!
    @IBOutlet var checkImage: UIImageView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var itemNumberLbl: UILabel!
    @IBOutlet var itemNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

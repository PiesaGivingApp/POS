//
//  ItemSizeTableCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 20/10/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ItemSizeTableCell: UITableViewCell {
        
    @IBOutlet var backView: UIView!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

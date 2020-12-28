//
//  DrawerBalanceTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 25/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class DrawerBalanceTableViewCell: UITableViewCell {
    
    
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        backView.layer.cornerRadius = 8
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backView.layer.masksToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  HeaderCheckTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 02/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class HeaderCheckTableViewCell: UITableViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var tableNumLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 8
        backView.layer.masksToBounds = true
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  CustomerTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 05/10/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
        
    @IBOutlet var backView: UIView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

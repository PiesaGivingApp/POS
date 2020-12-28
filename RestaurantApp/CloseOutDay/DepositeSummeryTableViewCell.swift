//
//  DepositeSummeryTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class DepositeSummeryTableViewCell: UITableViewCell {
    
    
    @IBOutlet var expectedDepositLbl: UILabel!
    @IBOutlet var actualDepositLbl: UILabel!
    @IBOutlet var overageLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

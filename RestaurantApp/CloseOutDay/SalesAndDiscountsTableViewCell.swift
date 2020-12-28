//
//  SalesAndDiscountsTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class SalesAndDiscountsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var headingNameLbl: UILabel!
    
    @IBOutlet var categoryLbl: UILabel!
    @IBOutlet var quantityLbl: UILabel!
    @IBOutlet var amountLbl: UILabel!
    
    @IBOutlet var firstLbl: UILabel!
    @IBOutlet var secondLbl: UILabel!
    
    @IBOutlet var quantity1Lbl: UILabel!
    @IBOutlet var quantity2Lbl: UILabel!
    
    @IBOutlet var amount1Lbl: UILabel!
    @IBOutlet var amount2Lbl: UILabel!
    
    @IBOutlet var totalNameLbl: UILabel!
    @IBOutlet var totalAmountLbl: UILabel!
    
    @IBOutlet var secondLblTop: NSLayoutConstraint!
    @IBOutlet var secondLblHeight: NSLayoutConstraint!
    
    @IBOutlet var totalLblTop: NSLayoutConstraint!
    @IBOutlet var totalLblHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

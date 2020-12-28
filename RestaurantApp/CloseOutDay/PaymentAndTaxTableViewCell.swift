//
//  PaymentAndTaxTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class PaymentAndTaxTableViewCell: UITableViewCell {
        
    @IBOutlet var headingNameLbl: UILabel!
    
    
    @IBOutlet var firstLbl: UILabel!
    @IBOutlet var secondLbl: UILabel!
    @IBOutlet var thirdLbl: UILabel!
    @IBOutlet var fourthLbl: UILabel!
    @IBOutlet var fifthlbl: UILabel!
    
    @IBOutlet var amount1Lbl: UILabel!
    @IBOutlet var amount2Lbl: UILabel!
    @IBOutlet var amount3Lbl: UILabel!
    @IBOutlet var amount4Lbl: UILabel!
    @IBOutlet var amount5Lbl: UILabel!
        
    @IBOutlet var totalLbl1: UILabel!
    @IBOutlet var totalLbl2: UILabel!
    
    @IBOutlet var totalAmount1Lbl: UILabel!
    @IBOutlet var totalAmount2Lbl: UILabel!
        
    @IBOutlet var label3Top: NSLayoutConstraint!
    @IBOutlet var label3Height: NSLayoutConstraint!
    @IBOutlet var label4Top: NSLayoutConstraint!
    @IBOutlet var label4Height: NSLayoutConstraint!
    @IBOutlet var label5Top: NSLayoutConstraint!
    @IBOutlet var label5Height: NSLayoutConstraint!
    
    @IBOutlet var totalLbl2Top: NSLayoutConstraint!
    @IBOutlet var totalLbl2Height: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

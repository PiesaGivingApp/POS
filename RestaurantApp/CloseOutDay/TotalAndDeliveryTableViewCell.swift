//
//  TotalAndDeliveryTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class TotalAndDeliveryTableViewCell: UITableViewCell {
    
    
    @IBOutlet var headNameLbl: UILabel!
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    
    @IBOutlet var amount1Lbl: UILabel!
    @IBOutlet var amount2Lbl: UILabel!
    @IBOutlet var amount3Lbl: UILabel!
    @IBOutlet var amount4Lbl: UILabel!
    
    @IBOutlet var count1Lbl: UILabel!
     @IBOutlet var count2Lbl: UILabel!
     @IBOutlet var count3Lbl: UILabel!
     @IBOutlet var count4Lbl: UILabel!
    
    
    @IBOutlet var label2Top: NSLayoutConstraint!
    @IBOutlet var label2Height: NSLayoutConstraint!
    @IBOutlet var label3Top: NSLayoutConstraint!
    @IBOutlet var label3Height: NSLayoutConstraint!
    @IBOutlet var label4Top: NSLayoutConstraint!
    @IBOutlet var label4Height: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

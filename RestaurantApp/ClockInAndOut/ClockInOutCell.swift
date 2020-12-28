//
//  ClockInOutCell.swift
//  RestaurantApp
//
//  Created by Naveen kunchal on 27/10/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ClockInOutCell: UITableViewCell {

    @IBOutlet weak var inLbl: UILabel!
    
    @IBOutlet weak var hoursLbl: UILabel!
    @IBOutlet weak var outLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var jobLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

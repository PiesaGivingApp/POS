//
//  LaborTableViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class LaborTableViewCell: UITableViewCell {
    
    
    @IBOutlet var headingLbl: UILabel!
    @IBOutlet var totalNetSalesLbl: UILabel!
    @IBOutlet var totalHoursLbl: UILabel!
    @IBOutlet var totalLaborCostLbl: UILabel!
    @IBOutlet var costPercentLbl: UILabel!
    @IBOutlet weak var employeeLbl: UILabel!
 
    
    @IBOutlet var totalNetSales: UILabel!
    @IBOutlet var totalHours: UILabel!
    @IBOutlet var totalLaborCost: UILabel!
    @IBOutlet var costOrSales: UILabel!
    @IBOutlet var tipsPercentLbl: UILabel!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

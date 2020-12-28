//
//  MoneyCollectionViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 15/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class MoneyCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet var backView: UIView!
    @IBOutlet var amountLbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var moneyImgView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        backView.layer.borderWidth = 1
        backView.layer.borderColor = navyBlueColor.cgColor
        // Initialization codm e
    }

}

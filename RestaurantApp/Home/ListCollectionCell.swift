//
//  ListCollectionCell.swift
//  RestaurantApp
//
//  Created by INDOBYTES on 03/06/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 5
        // Initialization code
    }

}

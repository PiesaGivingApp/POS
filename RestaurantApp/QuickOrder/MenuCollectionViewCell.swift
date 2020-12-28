//
//  MenuCollectionViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 31/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var backImg: UIImageView!    
    @IBOutlet var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        // Initialization code
    }

}

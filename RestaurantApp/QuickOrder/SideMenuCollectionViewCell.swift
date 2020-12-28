//
//  SideMenuCollectionViewCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 06/10/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class SideMenuCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet var backView: UIView!
    @IBOutlet var backImageView: UIImageView!
    @IBOutlet var sideMenuImag: UIImageView!
    @IBOutlet var sideMenuNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        
        // Initialization code
    }

}

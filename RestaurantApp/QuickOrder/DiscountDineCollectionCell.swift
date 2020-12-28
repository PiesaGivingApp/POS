//
//  DiscountDineCollectionCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/12/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class DiscountDineCollectionCell: UICollectionViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var backImage: UIImageView!
    @IBOutlet var itemNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backImage.layer.cornerRadius = 5
        backImage.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
        shadowToView(view: backView)
        // Initialization code
    }
    
    func shadowToView(view:UIView){
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
       }
    
}

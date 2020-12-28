//
//  ShowAllDayCollectionCell.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 05/11/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ShowAllDayCollectionCell: UICollectionViewCell {
        
    @IBOutlet var backView: UIView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var quantityLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 5
        shadowToView(view: backView)
        // Initialization code
    }
    
    func shadowToView(view:UIView){
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 1, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
       }

}

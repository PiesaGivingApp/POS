//
//  ListTableCell.swift
//  RestaurantApp
//
//  Created by INDOBYTES on 03/06/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

protocol didselectClickedDelegate:class {
    func didItemSelect(indexPathRow:Int,itemName:String)
}

class ListTableCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    weak var delegate : didselectClickedDelegate?
    var array = Array<AnyObject>()
    var imageArray = Array<AnyObject>()
    var number = Int()
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var headerLabel: UILabel!    
    @IBOutlet weak var ListCollectionView: UICollectionView!    
    @IBOutlet var gradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ListCollectionView.delegate = self
        ListCollectionView.dataSource = self
        
        backView.layer.cornerRadius = 5
        
        gradientView.applyGradientView(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        
        self.ListCollectionView.register(UINib(nibName: "ListCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionCell")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadCollectionView(array1:Array<AnyObject>){
           array = array1
       }
    func reloadCollectionView2(imgArray1:Array<AnyObject>){
        imageArray = imgArray1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionCell", for: indexPath) as! ListCollectionCell
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.shadowOffset = CGSize(width: 1, height: 3)
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.5
        cell.backView.layer.shadowRadius = 4
        
        cell.nameLabel.text = array[indexPath.row] as! String
        cell.iconImageView.image = UIImage(named: imageArray[indexPath.row] as! String)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = array[indexPath.item] as! String
        delegate?.didItemSelect(indexPathRow: indexPath.item,itemName:name)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
        return CGSize(width: 155, height: 155)
      
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
           
            return 20
       }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
       {

       return 0
    }

    
    
    
}

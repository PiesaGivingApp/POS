//
//  CountBillsViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 14/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class CountBillsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    var moneyArr = ["1","1","5","5","10","10","25","25","50","50","100","100"]
    var moneyImgArr = ["money_icon","business_icon","money_icon","business_icon","money_icon","business_icon","money_icon","business_icon","money_icon","business_icon","money_icon","business_icon"]
    var numberOnScreen : Double = 0
    var performingMath = false
    var selectedHint = Int()
    
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView1: UIView!
    @IBOutlet var backView2: UIView!
    @IBOutlet var moneyCollectionView: UICollectionView!
    
    @IBOutlet var amountIconLbl: UILabel!
    @IBOutlet var selectedAmountLbl: UILabel!
    @IBOutlet var enteringAmountLbl: UILabel!
    @IBOutlet var totalAmountLbl: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    @IBOutlet var clearBtn: UIButton!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button00: UIButton!
    @IBOutlet var removeBtn: UIButton!
    @IBOutlet var dollor6Btn: UIButton!
    @IBOutlet var dollor8Btn: UIButton!
    @IBOutlet var doneBtn: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedHint = -1
        vcBackView.layer.cornerRadius = 8
        vcBackView.layer.masksToBounds = true
        backView1.layer.cornerRadius = 8
        amountIconLbl.layer.cornerRadius = 5
        shadowToView(view: amountIconLbl)
        selectedAmountLbl.layer.cornerRadius = 5
        shadowToView(view: selectedAmountLbl)
        enteringAmountLbl.layer.cornerRadius = 5
        shadowToView(view: enteringAmountLbl)
        totalAmountLbl.layer.cornerRadius = 5
        shadowToView(view: totalAmountLbl)
        button1.layer.cornerRadius = 5
        button2.layer.cornerRadius = 5
        button3.layer.cornerRadius = 5
        button4.layer.cornerRadius = 5
        button5.layer.cornerRadius = 5
        button6.layer.cornerRadius = 5
        button7.layer.cornerRadius = 5
        button8.layer.cornerRadius = 5
        button9.layer.cornerRadius = 5
        button0.layer.cornerRadius = 5
        button00.layer.cornerRadius = 5
        clearBtn.layer.cornerRadius = 5
        removeBtn.layer.cornerRadius = 5
        doneBtn.layer.cornerRadius = 5
        doneBtn.layer.masksToBounds = true
        dollor6Btn.layer.cornerRadius = 5
        shadowToView(view: dollor6Btn)
        dollor8Btn.layer.cornerRadius = 5
        shadowToView(view: dollor8Btn)
        
        moneyCollectionView.delegate = self
        moneyCollectionView.dataSource = self
        
        moneyCollectionView.register(UINib(nibName: "MoneyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoneyCollectionViewCell")

        // Do any additional setup after loading the view.
    }
    
    func shadowToView(view:UIView){
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 173/255, green: 185/255, blue: 207/255, alpha: 0.36).cgColor
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 6
       }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cashDrawerAction(_ sender: Any) {
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
    
    @IBAction func numbersAction(_ sender: UIButton) {
                if performingMath == true {
                enteringAmountLbl.text = String(sender.tag-1)
                numberOnScreen = Double(enteringAmountLbl.text!)!
                performingMath = false
                } else {
                    if sender.tag == 0 {
                     enteringAmountLbl.text = enteringAmountLbl.text! + "00"
                    } else {
                enteringAmountLbl.text = enteringAmountLbl.text! + String(sender.tag-1)
        //        numberOnScreen = Double(numberLabel.text!)!
                    }
                }
    }
    
    @IBAction func otherBtnActions(_ sender: UIButton) {
        if sender.tag == 101 {
            var runningNumber = enteringAmountLbl.text!
            if runningNumber == "0"{
                enteringAmountLbl.text = "0"
            } else {
            runningNumber = String(runningNumber.dropLast())
            enteringAmountLbl.text = "\(runningNumber)"
            }
        } else if sender.tag == 100{
            enteringAmountLbl.text = "0"
        } else if sender.tag == 102{
            enteringAmountLbl.text = "6.00"
        } else if sender.tag == 103{
            enteringAmountLbl.text = "8.00"
        }
    }
    
        /// Collection View Methods
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 12
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoneyCollectionViewCell", for: indexPath) as! MoneyCollectionViewCell
            if selectedHint == indexPath.item {
                cell.backView.backgroundColor = blueColor
                cell.backView.layer.masksToBounds = true
                cell.amountLbl.textColor = UIColor.white
                cell.numberLbl.textColor = UIColor.white
                cell.backView.layer.borderWidth = 0
            } else {
                cell.backView.backgroundColor = UIColor.white
                cell.backView.layer.masksToBounds = true
                cell.amountLbl.textColor = blackTextColor
                cell.numberLbl.textColor = blackTextColor
                cell.backView.layer.borderWidth = 1
            }
            cell.amountLbl.text = moneyArr[indexPath.item]
            cell.moneyImgView.image = UIImage(named: moneyImgArr[indexPath.row])
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             let size = moneyCollectionView.frame.size.width - 30
            
             return CGSize(width: size/2, height: 80)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
        {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = moneyCollectionView.cellForItem(at: IndexPath(row: indexPath.item, section: 0)) as! MoneyCollectionViewCell
            selectedHint = indexPath.item
            let data = moneyArr[indexPath.item]
            let doubleValue = Double(data)!
            selectedAmountLbl.text = "$ \(doubleValue)"
            moneyCollectionView.reloadData()
        }
    
}

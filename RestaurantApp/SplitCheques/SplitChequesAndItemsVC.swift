//
//  SplitChequesAndItemsVC.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 02/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit
protocol backDelegate:class {
    func spiledArraysFunction(dict:Array<[String:Any]>)
}
class SplitChequesAndItemsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(tableView == defaulttableView){
            return defaultArray.count + 1
            
        }else if(tableView == firsttableView){
            return firstArray.count + 1
            
        }else if(tableView == secondTableView){
            return secondArray.count + 1
            
        }else if(tableView == thirdtableView){
            return thirdArray.count + 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            return 0
        } else {
            
            if(tableView == defaulttableView){
                
                
                if(defaultSubArray.count == 0){
                    return 0
                    
                }else{
                    
                    let obj = defaultSubArray[section - 1]
                    
                    let arr = obj["subArray"] as! Array<AnyObject>
                    
                    return arr.count
                    
                }
  
            } else if(tableView == firsttableView){
                
                
                if(firstSubArray.count == 0){
                    return 0
                    
                }else{
                    let obj = firstSubArray[section - 1]
                    
                    let arr = obj["subArray"] as! Array<AnyObject>
                    
                    return arr.count
                    
                }
  
            } else if(tableView == secondTableView){
                
                
                if(secondSubArray.count == 0){
                    return 0
                    
                }else{
                    let obj = secondSubArray[section - 1]
                    
                    let arr = obj["subArray"] as! Array<AnyObject>
                    
                    return arr.count
                    
                }
    
            }else if(tableView == thirdtableView){
                
                
                if(thirdSubArray.count == 0){
                    return 0
                    
                }else{
                    let obj = thirdSubArray[section - 1]
                    
                    let arr = obj["subArray"] as! Array<AnyObject>
                    
                    return arr.count
                    
                }
                
                
            
                
            }else{
                return 0
            }
          
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            return UITableViewCell()
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell", for: indexPath) as! ItemsTableViewCell

                cell.itemNameLbl.textColor = UIColor.darkGray
            if(tableView == defaulttableView){
                
                let data = defaultSubArray[indexPath.section - 1]
                            
                let subArr1 = data["subArray"] as! Array<AnyObject>
                
                let obj = subArr1[indexPath.row]
                
                let type = (self.themes.checkNullValue(obj["type"] as AnyObject) as! String)
                if(type == "modifier"){
                    cell.itemNameLbl.text = (self.themes.checkNullValue(obj["modifierName"] as AnyObject) as! String)
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                   // self.itemPrice = self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["modifierUnitPrice"] as AnyObject) as! String)"
                    
                    
                } else {
                    
                                        cell.itemNameLbl.text = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                                        let qty:Int = 1
                                        cell.amountLbl.text = ""
                                       // self.itemPrice = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                                        cell.tipLabel.text = ""
                                        cell.totalAmountLbl.textColor = UIColor.darkGray
                                        cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String)"
 
                }
 
            } else if(tableView == firsttableView){
                
                let data = firstSubArray[indexPath.section - 1]
                            
                let subArr1 = data["subArray"] as! Array<AnyObject>
                
                let obj = subArr1[indexPath.row]
                
                let type = (self.themes.checkNullValue(obj["type"] as AnyObject) as! String)
                if(type == "modifier"){
                    cell.itemNameLbl.text = (self.themes.checkNullValue(obj["modifierName"] as AnyObject) as! String)
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                   // self.itemPrice = self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["modifierUnitPrice"] as AnyObject) as! String)"
                    
                    
                } else {
                    
                    cell.itemNameLbl.text = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                                        let qty:Int = 1
                    cell.amountLbl.text = ""
                                       // self.itemPrice = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String)"
         
                }
                                             
            } else if(tableView == secondTableView) {
                
                let data = secondSubArray[indexPath.section - 1]
                            
                let subArr1 = data["subArray"] as! Array<AnyObject>
                
                let obj = subArr1[indexPath.row]
                
                let type = (self.themes.checkNullValue(obj["type"] as AnyObject) as! String)
                if(type == "modifier"){
                    cell.itemNameLbl.text = (self.themes.checkNullValue(obj["modifierName"] as AnyObject) as! String)
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                   // self.itemPrice = self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["modifierUnitPrice"] as AnyObject) as! String)"
                                    
                } else {
                    
                    cell.itemNameLbl.text = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                    // self.itemPrice = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String)"
   
                }
    
            } else if(tableView == thirdtableView){
                
                let data = thirdSubArray[indexPath.section - 1]
                            
                let subArr1 = data["subArray"] as! Array<AnyObject>
                
                let obj = subArr1[indexPath.row]
                
                let type = (self.themes.checkNullValue(obj["type"] as AnyObject) as! String)
                if(type == "modifier"){
                    cell.itemNameLbl.text = (self.themes.checkNullValue(obj["modifierName"] as AnyObject) as! String)
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                   // self.itemPrice = self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["modifierUnitPrice"] as AnyObject) as! String)"
                                        
                }else{
                    
                    cell.itemNameLbl.text = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                    let qty:Int = 1
                    cell.amountLbl.text = ""
                    // self.itemPrice = self.themes.checkNullValue(obj["name"] as AnyObject) as! String
                    cell.tipLabel.text = ""
                    cell.totalAmountLbl.textColor = UIColor.darkGray
                    cell.totalAmountLbl.text = "$\(self.themes.checkNullValue(obj["requestPrice"] as AnyObject) as! String)"
    
                }
 
            }
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCheckTableViewCell") as! HeaderCheckTableViewCell
        
        return header
        } else {
                        
            if(tableView == defaulttableView){
                let header = tableView.dequeueReusableCell(withIdentifier: "ItemCheckTableViewCell") as! ItemCheckTableViewCell
                
                let data = defaultArray[section - 1]
             
                header.itemNameLbl.text = (self.themes.checkNullValue(data["Name"] as AnyObject) as! String)
                
                header.itemNumberLbl.text = (self.themes.checkNullValue(data["item_Qty"] as AnyObject) as! String)
                header.checkButton.tag = section
                header.checkButton.addTarget(self, action: #selector(defaultCheckButtonClicked(button:)), for: .touchUpInside)
                
                if defaultArrSelectedIndex.contains(section) {
                  //  cell.img.textColor = UIColor.white
                    header.checkImage.image = UIImage(named: "status_check")
                } else {
                    header.checkImage.image = UIImage(named: "unCheck")
                }
                
                return header
            } else if(tableView == firsttableView){
                let header = tableView.dequeueReusableCell(withIdentifier: "ItemCheckTableViewCell") as! ItemCheckTableViewCell
                
                let data = firstArray[section - 1]
                
             
                header.itemNameLbl.text = (self.themes.checkNullValue(data["Name"] as AnyObject) as! String)
                
                header.itemNumberLbl.text = (self.themes.checkNullValue(data["item_Qty"] as AnyObject) as! String)
                header.checkButton.tag = section
                header.checkButton.addTarget(self, action: #selector(firstCheckButtonClicked(button:)), for: .touchUpInside)
               
                
                if firstArrSelectedIndex.contains(section) {
                  //  cell.img.textColor = UIColor.white
                    header.checkImage.image = UIImage(named: "status_check")
                } else {
                    header.checkImage.image = UIImage(named: "unCheck")
                }
                
                return header
            } else if(tableView == secondTableView){
                let header = tableView.dequeueReusableCell(withIdentifier: "ItemCheckTableViewCell") as! ItemCheckTableViewCell
                
                let data = secondArray[section - 1]
                
             
                header.itemNameLbl.text = (self.themes.checkNullValue(data["Name"] as AnyObject) as! String)
                
                header.itemNumberLbl.text = (self.themes.checkNullValue(data["item_Qty"] as AnyObject) as! String)
                header.checkButton.tag = section
                header.checkButton.addTarget(self, action: #selector(secondButtonClicked(button:)), for: .touchUpInside)
               
                
                if secondArrSelectedIndex.contains(section) {
                  //  cell.img.textColor = UIColor.white
                    header.checkImage.image = UIImage(named: "status_check")
                } else {
                    header.checkImage.image = UIImage(named: "unCheck")
                }
                
                return header
            } else if(tableView == thirdtableView){
                let header = tableView.dequeueReusableCell(withIdentifier: "ItemCheckTableViewCell") as! ItemCheckTableViewCell
                
                let data = thirdArray[section - 1]
                             
                header.itemNameLbl.text = (self.themes.checkNullValue(data["Name"] as AnyObject) as! String)
                
                header.itemNumberLbl.text = (self.themes.checkNullValue(data["item_Qty"] as AnyObject) as! String)
                header.checkButton.tag = section
                header.checkButton.addTarget(self, action: #selector(thirdButtonClicked(button:)), for: .touchUpInside)
                               
                if thirdArrSelectedIndex.contains(section) {
                  //  cell.img.textColor = UIColor.white
                    header.checkImage.image = UIImage(named: "status_check")
                } else {
                    header.checkImage.image = UIImage(named: "unCheck")
                }
                
                return header
            }else{
                let header = tableView.dequeueReusableCell(withIdentifier: "ItemCheckTableViewCell") as! ItemCheckTableViewCell
                
                let data = fourthArray[section - 1]
                
             
                header.itemNameLbl.text = (self.themes.checkNullValue(data["Name"] as AnyObject) as! String)
                
                header.itemNumberLbl.text = (self.themes.checkNullValue(data["item_Qty"] as AnyObject) as! String)
                header.checkButton.tag = section
  
                if fourthArrSelectedIndex.contains(section) {
                  //  cell.img.textColor = UIColor.white
                    header.checkImage.image = UIImage(named: "status_check")
                } else {
                    header.checkImage.image = UIImage(named: "unCheck")
                }
                
                return header
            }
        }
    }
    
    @objc func defaultCheckButtonClicked(button: UIButton){
        splitClickedHint = 0
        if(defaultHin == 0){
            
            defaultHin = 1
            supportArr = defaultArray

            supportSubArray = defaultSubArray
        }

        let obj = defaultArray[button.tag - 1]
        let array = defaultSubArray[button.tag - 1]
        let arr = array["subArray"] as! Array<AnyObject>
        let name = (self.themes.checkNullValue(obj["Name"] as AnyObject) as! String)
                
            if defaultArrSelectedIndex.contains(button.tag) {
                defaultArrSelectedIndex = defaultArrSelectedIndex.filter { $0 != button.tag}
                supportArr.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                supportSubArray.append(dict)
                for i in 0...firstArray.count - 1{
                   let obj1 = firstArray[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        firstArray.remove(at: i)
                        firstSubArray.remove(at: i)
                       
                        break
                    }
                }
    
            } else {
                defaultArrSelectedIndex.append(button.tag)
                   
                firstArray.append(obj)
                
                let dict = ["name":name,"subArray":arr] as [String : Any]
                
                firstSubArray.append(dict)
               
                //defaultSubArray.remove(at: button.tag - 1)
                for i in 0...supportArr.count - 1{
                   let obj1 = supportArr[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        supportArr.remove(at: i)
                        supportSubArray.remove(at: i)
                        break
                        
                    }
                }
                                
            }

        defaulttableView.reloadData()
 
    }
    
    @objc func firstCheckButtonClicked(button: UIButton){
        splitClickedHint = 1
        if(firstHin == 0){
            
            firstHin = 1
            supportArr = firstArray
            supportSubArray = firstSubArray
        }
        
        let obj = firstArray[button.tag - 1]
        let array = firstSubArray[button.tag - 1]
        
        let arr = array["subArray"] as! Array<AnyObject>
        let name = (self.themes.checkNullValue(obj["Name"] as AnyObject) as! String)
        
        
            if firstArrSelectedIndex.contains(button.tag) {
                firstArrSelectedIndex = firstArrSelectedIndex.filter { $0 != button.tag}
                supportArr.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                supportSubArray.append(dict)
                for i in 0...secondArray.count - 1{
                   let obj1 = secondArray[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        secondArray.remove(at: i)
                        secondSubArray.remove(at: i)
                        break
                    }
                }
    
            } else {
                firstArrSelectedIndex.append(button.tag)
                   
                secondArray.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                
                secondSubArray.append(dict)
                
                for i in 0...supportArr.count - 1{
                   let obj1 = supportArr[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        supportArr.remove(at: i)
                        supportSubArray.remove(at: i)
                        break
                    }
                }
                
                
                }

        firsttableView.reloadData()
        
    }
    
    @objc func secondButtonClicked(button: UIButton){
        splitClickedHint = 2
        if(secondHin == 0){
            
            secondHin = 1
            supportArr = secondArray
            supportSubArray = secondSubArray
        }
        
        let obj = secondArray[button.tag - 1]
        let array = secondSubArray[button.tag - 1]
        
        let arr = array["subArray"] as! Array<AnyObject>
        
        let name = (self.themes.checkNullValue(obj["Name"] as AnyObject) as! String)
        
        
            if secondArrSelectedIndex.contains(button.tag) {
                secondArrSelectedIndex = secondArrSelectedIndex.filter { $0 != button.tag}
                supportArr.append(obj)
                
                let dict = ["name":name,"subArray":arr] as [String : Any]
                supportSubArray.append(dict)
                for i in 0...thirdArray.count - 1{
                   let obj1 = thirdArray[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        thirdArray.remove(at: i)
                        thirdSubArray.remove(at: i)
                        break
                    }
                }
    

            } else {
                secondArrSelectedIndex.append(button.tag)
                   
                thirdArray.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                
                thirdSubArray.append(dict)
                for i in 0...supportArr.count - 1{
                   let obj1 = supportArr[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        supportArr.remove(at: i)
                        supportSubArray.remove(at: i)
                        break
                    }
                }
                
                
                }
 
        secondTableView.reloadData()
        
    }
    
    @objc func thirdButtonClicked(button: UIButton){
        splitClickedHint = 3
        if(thirdHin == 0){
            
            thirdHin = 1
            supportArr = thirdArray
            supportSubArray = thirdSubArray
        }
        
        let obj = thirdArray[button.tag - 1]
        let array = thirdSubArray[button.tag - 1]
        
        let arr = array["subArray"] as! Array<AnyObject>
        
        let name = (self.themes.checkNullValue(obj["Name"] as AnyObject) as! String)
        
        
            if thirdArrSelectedIndex.contains(button.tag) {
                thirdArrSelectedIndex = thirdArrSelectedIndex.filter { $0 != button.tag}
                supportArr.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                supportSubArray.append(dict)
                for i in 0...defaultArray.count - 1{
                   let obj1 = defaultArray[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        defaultArray.remove(at: i)
                        defaultSubArray.remove(at: i)
                        break
                    }
                }
    
            } else {
                thirdArrSelectedIndex.append(button.tag)
                   
                defaultArray.append(obj)
                let dict = ["name":name,"subArray":arr] as [String : Any]
                
                defaultSubArray.append(dict)
                
                for i in 0...supportArr.count - 1{
                   let obj1 = supportArr[i]
                    
                    let name1 = (self.themes.checkNullValue(obj1["Name"] as AnyObject) as! String)
                    
                    if(name1 == name){
                        
                        supportArr.remove(at: i)
                        supportSubArray.remove(at: i)
                        break
                    }
                }
                
            }
        
        thirdtableView.reloadData()
    }
       
    func didItemSelect(indexPathRow: Int, obj: AnyObject) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return 50
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    weak var delegate:backDelegate?

    @IBOutlet weak var thirdtableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var firsttableView: UITableView!
    @IBOutlet weak var defaulttableView: UITableView!
    
    var defaultHin = Int()
    var firstHin = Int()
    var secondHin = Int()
    var thirdHin = Int()
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    var splitClickedHint = Int()
    var firstArray = [[String:Any]]()
    var defaultArrSelectedIndex = [Int]()
    var firstArrSelectedIndex = [Int]()
    var secondArrSelectedIndex = [Int]()
    var thirdArrSelectedIndex = [Int]()
    var fourthArrSelectedIndex = [Int]()
    var globalMenuSubObj = [[String:Any]]()
    var specialRequestObj = [[String:Any]]()
    var supportArr = [[String:Any]]()
    var supportSubArray = [[String:Any]]()
    var secondArray = [[String:Any]]()
    var thirdArray = [[String:Any]]()
    var fourthArray = [[String:Any]]()
    var defaultArray = [[String:Any]]()
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var checksCollectionView: UICollectionView!
    var itemArray1 = [[String:Any]]()
            
    var defaultSubArray = Array<[String:Any]>()
    var firstSubArray = Array<[String:Any]>()

    var secondSubArray = Array<[String:Any]>()

    var thirdSubArray = Array<[String:Any]>()
    
    var collectionViewSelectedHint = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        for i in 0...defaultArray.count - 1{
            let obj = defaultArray[i]
            
            let name = (self.themes.checkNullValue(obj["Name"] as AnyObject) as! String)
            
            let obj11 = globalMenuSubObj[i]
                        
            let arr = obj11["subObj"] as! Array<AnyObject>
            
            let obj12 = specialRequestObj[i]
        
            let arr1 = obj12["subObj"] as! Array<AnyObject>
                        
            let array = arr + arr1
                        
            let dict = ["name":name,"subArray":array] as [String : Any]
            
            defaultSubArray.append(dict)
            
        }

        firsttableView.register(UINib(nibName:"HeaderCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCheckTableViewCell")
        
        secondTableView.register(UINib(nibName:"HeaderCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCheckTableViewCell")
        thirdtableView.register(UINib(nibName:"HeaderCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCheckTableViewCell")
        
        defaulttableView.register(UINib(nibName:"HeaderCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderCheckTableViewCell")

        firsttableView.register(UINib(nibName:"ItemCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCheckTableViewCell")
        
        secondTableView.register(UINib(nibName:"ItemCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCheckTableViewCell")
        thirdtableView.register(UINib(nibName:"ItemCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCheckTableViewCell")
        
        defaulttableView.register(UINib(nibName:"ItemCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCheckTableViewCell")
  
        firsttableView.register(UINib(nibName:"ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        
        secondTableView.register(UINib(nibName:"ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        thirdtableView.register(UINib(nibName:"ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        
        defaulttableView.register(UINib(nibName:"ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        
        firsttableView.delegate = self
        firsttableView.dataSource = self
        
        defaulttableView.delegate = self
        defaulttableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        thirdtableView.delegate = self
        thirdtableView.dataSource = self

        firsttableView.separatorColor = UIColor.clear
        secondTableView.separatorColor = UIColor.clear
        thirdtableView.separatorColor = UIColor.clear
        defaulttableView.separatorColor = UIColor.clear

        vcBackView.layer.cornerRadius = 8
        checksCollectionView.delegate = self
        checksCollectionView.dataSource = self
        checksCollectionView.register(UINib(nibName: "ChecksCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ChecksCollectionCell")

        // Do any additional setup after loading the view.
    }
    
    func shadowToTable (tableview:UITableView){
        tableview.layer.masksToBounds = false
        tableview.layer.shadowOffset = CGSize(width: 1, height: 3)
        tableview.layer.shadowColor = UIColor.black.cgColor
        tableview.layer.shadowOpacity = 0.5
        tableview.layer.shadowRadius = 4
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func splitAction(_ sender: Any) {
        
        defaultHin = 0
        firstHin = 0
        secondHin = 0
        thirdHin = 0

        if(splitClickedHint == 0){
            
          defaultArray = supportArr
            
            defaultSubArray = supportSubArray
        }else if(splitClickedHint == 1){
            
            firstArray = supportArr
            firstSubArray = supportSubArray

          }else if(splitClickedHint == 2){
            
            secondArray = supportArr
            secondSubArray = supportSubArray

          }else if(splitClickedHint == 3){
            
            thirdArray = supportArr
            thirdSubArray = supportSubArray

          }
        firstArrSelectedIndex.removeAll()
        defaultArrSelectedIndex.removeAll()
        secondArrSelectedIndex.removeAll()
        thirdArrSelectedIndex.removeAll()
        defaulttableView.reloadData()
        firsttableView.reloadData()
        secondTableView.reloadData()
        thirdtableView.reloadData()
        supportArr.removeAll()
        supportSubArray.removeAll()
    }
    
    @IBAction func seatAction(_ sender: Any) {
        
    }
    
    @IBAction func doneAction(_ sender: Any) {

        var splitArray = Array<[String:Any]>()

        if(defaultArray.count == 0){

        }else{
            
            let dict = ["name":"deafult","array":defaultArray,"subArray":defaultSubArray] as [String : Any]
            
            splitArray.append(dict);
            
        }

        if(firstArray.count == 0){
 
        }else{

            let dict = ["name":"first","array":firstArray,"subArray":firstSubArray] as [String : Any]
            
            splitArray.append(dict);
            
        }
        
        if(secondArray.count == 0){

        }else{
            
            let dict = ["name":"second","array":secondArray,"subArray":secondSubArray] as [String : Any]
            
            splitArray.append(dict);
  
        }
        
        if(thirdArray.count == 0){

        }else{
            
            let dict = ["name":"third","array":thirdArray,"subArray":thirdSubArray] as [String : Any]
            
            splitArray.append(dict);

        }
        
        print("Split Array is \(splitArray)")
        
        delegate?.spiledArraysFunction(dict: splitArray)
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChecksCollectionCell", for: indexPath) as! ChecksCollectionCell
        
//        cell.defaultArray = itemArray1
//
//        cell.splitCount = collectionViewSelectedHint
//     //   if indexPath.row == 0 {
//            cell.checkTableView.isHidden = false
//            cell.newCheckLbl.isHidden = true
//            cell.backView.layer.borderWidth = 0
//     //   } else {
////        cell.checkTableView.isHidden = true
////        cell.newCheckLbl.isHidden = false
//            cell.delegate = self
//        let yourViewBorder = CAShapeLayer()
//        yourViewBorder.strokeColor = UIColor.black.cgColor
//        yourViewBorder.lineDashPattern = [4, 4]
//        yourViewBorder.frame = cell.backView.bounds
//        yourViewBorder.fillColor = nil
//        yourViewBorder.path = UIBezierPath(rect: cell.backView.bounds).cgPath
            
            cell.backView.addDashedBorder()
        //cell.backView.layer.addSublayer(yourViewBorder)
        cell.backView.layer.cornerRadius = 5
        cell.backView.layer.masksToBounds = true
    //    }
        
        cell.checkTableView.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        collectionViewSelectedHint = indexPath.item
        
        checksCollectionView.reloadData()
  
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let size = checksCollectionView.frame.size.width - 50
        let height = checksCollectionView.frame.size.height - 20
         return CGSize(width: size/4, height: height)
    }
        
}

extension UIView {

    func addDashedBorder() {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [2,3]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}

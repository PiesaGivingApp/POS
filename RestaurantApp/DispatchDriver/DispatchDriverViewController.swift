//
//  DispatchDriverViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 27/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class DispatchDriverViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    var unAssaignedArr = [AnyObject]()
    var selectedCellHint = Int()
    var drivetListArr = [AnyObject]()
    var selectDrievrHint = Int()
    var driverId = ""
    var ordeId = ""

    @IBOutlet var selectChequeLbl: UILabel!
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView: UIView!
    
    @IBOutlet var sortByLbl: UILabel!
    @IBOutlet var chequeCollectionView: UICollectionView!
    
    @IBOutlet var hideView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var popCancelBtn: UIButton!
    @IBOutlet var popOkBtn: UIButton!    
    @IBOutlet var driversTableView: UITableView!
    @IBOutlet var dispatchDriverBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCellHint = -1
        selectDrievrHint = -1
        vcBackView.layer.cornerRadius = 8
        backView.layer.cornerRadius = 8
        popUpView.layer.cornerRadius = 8
        popCancelBtn.layer.cornerRadius = 5
        popOkBtn.layer.cornerRadius = 5
        driversTableView.separatorColor = UIColor.clear
        dispatchDriverBtn.isEnabled = false
        
        hideView.isHidden = true
        popUpView.isHidden = true
        popOkBtn.isHidden = true
        popCancelBtn.isHidden = true
                
        popCancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        popCancelBtn.layer.masksToBounds = true
        popOkBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        popOkBtn.layer.masksToBounds = true
        
        chequeCollectionView.register(UINib(nibName: "ChequeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChequeCollectionViewCell")
        driversTableView.register(UINib(nibName: "ServerTableViewCell", bundle: nil), forCellReuseIdentifier: "ServerTableViewCell")
        
        getUnAssignedDeliveryAPI(restaurantId: restId, createdBy: createId)

        // Do any additional setup after loading the view.
    }
    
    func shadowForView(view: UIView){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 2)
        view.layer.shadowOpacity = 3.0
        view.layer.shadowRadius = 3.0
        view.layer.masksToBounds = false
    }
    
    @IBAction func doneAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
        
    @IBAction func dispatchDriverAction(_ sender: Any) {
        hideView.isHidden = false
        popUpView.isHidden = false
        popOkBtn.isHidden = false
        popCancelBtn.isHidden = false
        let id = self.themes.getUserId()!
        getAllDriverListAPI(restaurantId: restId, empId: id)
    }
    
    @IBAction func popCancelAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        popOkBtn.isHidden = true
        popCancelBtn.isHidden = true
    }
    
    @IBAction func popOkAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        popOkBtn.isHidden = true
        popCancelBtn.isHidden = true
        
        dispatch_delivery_to_driverAPI(restaurantId: restId, driverId: driverId, orderId: ordeId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivetListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerTableViewCell", for: indexPath) as! ServerTableViewCell
    
        if selectDrievrHint == indexPath.row {
                cell.backView.backgroundColor = blueColor
                cell.severNameLbl.textColor = UIColor.white
            } else {
                cell.backView.backgroundColor = UIColor.white
                cell.severNameLbl.textColor = blackTextColor
            }
        
        let data = drivetListArr[indexPath.row] as! [String:AnyObject]
        let fstNAme = self.themes.checkNullValue(data["firstName"] as AnyObject) as! String
        let lastName = self.themes.checkNullValue(data["lastName"] as AnyObject) as! String
        cell.severNameLbl.text = fstNAme + " " + lastName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectDrievrHint = indexPath.row
        let data = drivetListArr[indexPath.row] as! [String:AnyObject]
        let driverID = self.themes.checkNullValue(data["id"] as AnyObject) as! String
        self.driverId = driverID
        driversTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unAssaignedArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChequeCollectionViewCell", for: indexPath) as! ChequeCollectionViewCell
        if selectedCellHint == indexPath.row {
            cell.backView.backgroundColor = blueColor
            cell.dineInLbl.backgroundColor = navyBlueColor
            cell.dineInLbl.textColor = UIColor.white
            cell.dineInLbl.layer.masksToBounds = true
            cell.amountLbl.textColor = UIColor.white
            cell.dateLbl.textColor = UIColor.white
            cell.timeLbl.textColor = UIColor.white
            cell.itemsLbl.textColor = UIColor.white
            cell.numberLbl.textColor = UIColor.white
            cell.backView.layer.masksToBounds = true
            cell.backView.layer.borderWidth = 0
            shadowForView(view: cell.backView)
        } else {
            cell.backView.backgroundColor = UIColor.white
            cell.dineInLbl.backgroundColor = UIColor.init(red: 210/255, green: 225/255, blue: 236/255, alpha: 1.0)
            cell.dineInLbl.textColor = navyBlueColor
            cell.dineInLbl.layer.masksToBounds = true
            cell.amountLbl.textColor = navyBlueColor2
            cell.dateLbl.textColor = navyBlueColor2
            cell.timeLbl.textColor = navyBlueColor2
            cell.itemsLbl.textColor = navyBlueColor
            cell.numberLbl.textColor = navyBlueColor2
            cell.backView.layer.masksToBounds = true
            cell.backView.layer.borderWidth = 1
        }
        let data = unAssaignedArr[indexPath.item] as! [String:AnyObject]
        
        cell.dateLbl.text = self.themes.checkNullValue(data["orderDate"] as AnyObject) as! String
        cell.dineInLbl.text = "D-IN"
        cell.timeLbl.text = self.themes.checkNullValue(data["orderTime"] as AnyObject) as! String
        
         let checkNumbr = self.themes.checkNullValue(data["checkNumber"] as AnyObject) as! String
        cell.numberLbl.text = "#\(checkNumbr)"
        let itemsList = data["items_list"] as! [AnyObject]
        var itemsArr = [String]()
        for i in 0..<itemsList.count{
            let sample = itemsList[i]
            let item = sample["itemName"] as! String
            itemsArr.append(item)
        }
        cell.itemsLbl.text = itemsArr.joined(separator: ", ")
        cell.amountLbl.text = "$\(self.themes.checkNullValue(data["totalAmount"] as AnyObject) as! String)"
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let size = chequeCollectionView.frame.size.width
        
         return CGSize(width: size/4, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCellHint = indexPath.row
        dispatchDriverBtn.isEnabled = true
        let data = unAssaignedArr[indexPath.item] as! [String:AnyObject]
          let orderID = self.themes.checkNullValue(data["posOrderId"] as AnyObject) as! String
        self.ordeId = orderID
        self.chequeCollectionView.reloadData()
    }
    
    func dispatch_delivery_to_driverAPI(restaurantId:String,driverId:String,orderId:String) {
                 let networkRechability = urlService.connectedToNetwork()
                 if(networkRechability){
                     themes.showActivityIndicator(uiView: self.view)
     //                let id = self.themes.getUserId()!
                     var parameters = [String:AnyObject]()
                    parameters =  ["restaurantId":restaurantId,"driverId":driverId,"orderId":orderId as AnyObject] as [String : AnyObject]
                     print("parameters is \(parameters)")
                     urlService.serviceCallPostMethodWithParams(url: dispatch_delivery_to_driver, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                         print(response)
                     self.themes.hideActivityIndicator(uiView: self.view)
                     let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                    if(success == "1") {
                let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                         self.themes.showAlert(title: "Success", message: mesg, sender: self)
                    let terminalVc = self.storyboard?.instantiateViewController(withIdentifier: "TerminalDeliveryPendingVC") as! TerminalDeliveryPendingVC
                        terminalVc.fromScreen = "driver"
                        self.navigationController?.pushViewController(terminalVc, animated: true)
                        
                    } else {
                    let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                     self.themes.showAlert(title: "Oops ☹️", message: mesg, sender: self)
                     }
                   }
             } else {
                     self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                    }
         }
    
    func getAllDriverListAPI(restaurantId:String,empId:String) {
                let networkRechability = urlService.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
    //                let id = self.themes.getUserId()!
                    var parameters = [String:AnyObject]()
                    parameters =  ["restaurantId":restaurantId,"employeeId":empId as AnyObject] as [String : AnyObject]
                    print("parameters is \(parameters)")
                    urlService.serviceCallPostMethodWithParams(url: get_all_drivers_list, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                        print(response)
                    self.themes.hideActivityIndicator(uiView: self.view)
                    let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                   if(success == "1") {
                   self.drivetListArr = response["diversList"] as! [AnyObject]
                       self.driversTableView.delegate = self
                       self.driversTableView.dataSource = self
                       self.driversTableView.reloadData()
                   } else {
                   let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                    self.themes.showAlert(title: "Oops ☹️", message: mesg, sender: self)
                    }
                  }
            } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                   }
        }
    func getUnAssignedDeliveryAPI(restaurantId:String,createdBy:String) {
            let networkRechability = urlService.connectedToNetwork()
            if(networkRechability){
                themes.showActivityIndicator(uiView: self.view)
                var parameters = [String:AnyObject]()
                parameters =  ["restaurantId":restaurantId,"createdBy":createdBy as AnyObject] as [String : AnyObject]
                print("parameters is \(parameters)")
                urlService.serviceCallPostMethodWithParams(url: get_delivery_unassign_online_order, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                    print(response)
                self.themes.hideActivityIndicator(uiView: self.view)
                let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
               if(success == "1") {
                self.unAssaignedArr = response["deliveryOnlineOrderList"] as! [AnyObject]
                self.chequeCollectionView.delegate = self
                self.chequeCollectionView.dataSource = self
                self.chequeCollectionView.reloadData()
               } else {
                let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                self.themes.showAlert(title: "Message", message: mesg, sender: self)
                }
              }
        } else {
                self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
               }
    }
            
}

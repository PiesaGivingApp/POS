//
//  ViewController.swift
//  RestaurantApp
//
//  Created by INDOBYTES on 03/06/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,didselectClickedDelegate ,UITextViewDelegate{
    
    @IBOutlet weak var amountTFT: UITextField!
    @IBOutlet var employeNameLbl: UILabel!
        
    var themes = Themes()
    var urlService = URLservices.sharedInstance
 
   var headerNamesArray = ["MODE","MANAGER ACTIVITIES","CASH MANAGMENT","REPORTS","MY ACCOUNT","SUPPORT","SETUP"]
   var modeArray = ["TABLE SERVICE","QUICK ORDER","KITCHEN DISPLAY SCREEN","PAYMNET TERMINAL","DELIVERY","PENDING ORDERS"]
   var managerActivityArray = ["SHIFT REVIEW","TIME CARDS","CLOSE OUT DAY","FIND CHECKS","TRANSFER GIFT CARD ","REGISTER SWIPE CARD","LOOKUP CUSTOMER"]
   var cashManagmentArray = ["CASH DRAWERS","PAY OUT","DEPOSITS"]
   var reportsArray = ["SALES REPORTS","MENU REPORTS","LABOR REPORTS"]
   var myAccountArray = ["SHIFT REVIEW ","SALES REPORT","TIME CLOCK"]
   var supportArray = ["SUPPORT SITE","STATUS PAGE","START SCREEN SHARE"]
   var setUpArray = ["MENU","TABLES","LABOR","OTHER SETUP","DEVICE SETUP","ENABLE TEST MODE"]
    var modeImgsArray = ["quick_order","quick_order","kitchenDisplayScreen","payment_terminal", "delivery","pending_orders"]
    var managerActivityImgsArray = ["shift_review","time_cards","close_out_day","find_checks", "transfer_gift_card","register_swipecard","lookup_customer"]
    var cashManagmentImgsArray = ["cash_drawers","pay_out","deposits"]
    var reportsImgsArray = ["sales_reports","menu_reports","labor_reports"]
    var myAccountImgsArray = ["shift_review","sales_reports","time_clock"]
    var supportImgsArray = ["support_site","status_page","start_screen_share"]
    var setUpImgsArray = ["menu","tables","labor","other_setup", "device_setup","enable_test_mode"]
    
    @IBOutlet weak var ListTableview: UITableView!
        
    @IBOutlet var hideView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var selectDrawerLabel: UILabel!
    @IBOutlet var commentsTextView: UITextView!
    @IBOutlet var selectDrawerBtn: UIButton!
    @IBOutlet weak var popTableview: UITableView!
    @IBOutlet var popCancelBtn: UIButton!
    @IBOutlet var popOkBtn: UIButton!
    @IBOutlet var dropDownImage: UIImageView!
    
    var cashDrawersArr = [AnyObject]()
    
    var cashdrawerID = ""
    var AmountTFT = ""
    var commentTXT = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fstName = self.themes.getFirstName()!
        let lastName = self.themes.getLastName()!
        
        employeNameLbl.text = fstName + lastName
        
        ListTableview.delegate = self
        ListTableview.dataSource = self
        ListTableview.layer.cornerRadius = 8
        
        popUpView.layer.cornerRadius = 8
        
        amountTFT.layer.cornerRadius = 8
        amountTFT.layer.borderWidth = 1
        amountTFT.layer.borderColor = UIColor.lightGray.cgColor

        amountTFT.addPadding(padding: .equalSpacing(10))
        
        commentsTextView.layer.cornerRadius = 8
        commentsTextView.layer.borderWidth = 1
        commentsTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        popTableview.layer.cornerRadius = 8
        popTableview.layer.borderWidth = 1
        popTableview.layer.borderColor = UIColor.lightGray.cgColor
        
        selectDrawerBtn.layer.cornerRadius = 8
        selectDrawerBtn.layer.borderWidth = 1
        selectDrawerBtn.layer.borderColor = UIColor.lightGray.cgColor
        popCancelBtn.layer.cornerRadius = 8
        popCancelBtn.layer.masksToBounds = true
        popOkBtn.layer.cornerRadius = 8
        popOkBtn.layer.masksToBounds = true
        popCancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        popOkBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        
        self.ListTableview.register(UINib(nibName: "ListTableCell", bundle: nil), forCellReuseIdentifier: "ListTableCell")
        
        self.popTableview.register(UINib(nibName: "CashDrawerPayOutListCell", bundle: nil), forCellReuseIdentifier: "CashDrawerPayOutListCell")

        self.ListTableview.separatorColor = UIColor.clear
        
        hideView.isHidden = true
        popUpView.isHidden = true
        popCancelBtn.isHidden = true
        popOkBtn.isHidden = true
        popTableview.isHidden = true
        
        amountTFT.delegate = self
        commentsTextView.delegate = self
        commentsTextView.text = "Enter Your Comment"
        commentsTextView.textColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDrawerAction(_ sender: Any) {
       popTableview.isHidden = false
        Active_CashDrawers(restaurantId: restId)
//       View_CashDrawersAPI(restaurantId: restId)
    }
    
    @IBAction func popCancelAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        popCancelBtn.isHidden = true
        popOkBtn.isHidden = true
        popTableview.isHidden = true
    }
    
    @IBAction func popOkAction(_ sender: Any) {
//        hideView.isHidden = true
//        popUpView.isHidden = true
//        popCancelBtn.isHidden = true
//        popOkBtn.isHidden = true
//        popTableview.isHidden = true
        
        if cashdrawerID == "" {
        self.themes.showAlert(title: "Alert", message: "Please Select CashDrawer", sender: self)

        } else if amountTFT.text == "" {
            self.themes.showAlert(title: "Alert", message: "Please Enter the amount!", sender: self)
        } else {
        add_payoutAPI(restaurantId: restId, actionType: "pay_out", transactionType: "debit", action: "Pay Out", amount: amountTFT.text!, comment: commentsTextView.text!, cashDrawerId: cashdrawerID, createdBy: createId, status: 1)
        }
    }
    
    func didItemSelect(indexPathRow:Int,itemName:String) {
        
      //  TABLE SERVICE
        if itemName == "TABLE SERVICE"{
            let TableServicesVC = self.storyboard?.instantiateViewController(withIdentifier: "TableServicesVC") as! TableServicesVC
            self.navigationController?.pushViewController(TableServicesVC, animated:true)
        }else if itemName == "QUICK ORDER"{
            let quickOrderVc = self.storyboard?.instantiateViewController(withIdentifier: "QuickOrderViewController") as! QuickOrderViewController
            self.navigationController?.pushViewController(quickOrderVc, animated:true)
        } else if itemName == "PAYMNET TERMINAL"{
            let terminalVc = self.storyboard?.instantiateViewController(withIdentifier: "TerminalDeliveryPendingVC") as! TerminalDeliveryPendingVC
            terminalVc.fromScreen = "terminal"
            self.navigationController?.pushViewController(terminalVc, animated:true)
        } else if itemName == "DELIVERY" {
            let terminalVc = self.storyboard?.instantiateViewController(withIdentifier: "TerminalDeliveryPendingVC") as! TerminalDeliveryPendingVC
            terminalVc.fromScreen = "delivery"
            self.navigationController?.pushViewController(terminalVc, animated:true)
        } else if itemName == "PENDING ORDERS" {
            let terminalVc = self.storyboard?.instantiateViewController(withIdentifier: "TerminalDeliveryPendingVC") as! TerminalDeliveryPendingVC
            terminalVc.fromScreen = "pendingOrder"
            self.navigationController?.pushViewController(terminalVc, animated:true)
        } else if itemName == "SHIFT REVIEW" {
            let shiftReviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ShiftReviewViewController") as! ShiftReviewViewController

            self.navigationController?.pushViewController(shiftReviewVC, animated:true)
        } else if itemName == "TIME CARDS" {
            let timeCardsVC = self.storyboard?.instantiateViewController(withIdentifier: "TimeCardsViewController") as! TimeCardsViewController

            self.navigationController?.pushViewController(timeCardsVC, animated:true)
        } else if itemName == "REGISTER SWIPE CARD" {
            let registerCardsVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterswipeCardVC") as! RegisterswipeCardVC

            self.navigationController?.pushViewController(registerCardsVC, animated:true)
        }  else if itemName == "CLOSE OUT DAY" {
            let closeOutVC = self.storyboard?.instantiateViewController(withIdentifier: "CloseOutDayViewController") as! CloseOutDayViewController

            self.navigationController?.pushViewController(closeOutVC, animated:true)
        } else if itemName == "DEPOSITS"{
            let depositeVC = self.storyboard?.instantiateViewController(withIdentifier: "DepositsViewController") as! DepositsViewController

            self.navigationController?.pushViewController(depositeVC, animated:true)
        } else if itemName == "CASH DRAWERS"{
            let cashDrawerVC = self.storyboard?.instantiateViewController(withIdentifier: "CashDrawersViewController") as! CashDrawersViewController

            self.navigationController?.pushViewController(cashDrawerVC, animated:true)
        } else if itemName == "PAY OUT"{
            hideView.isHidden = false
            popUpView.isHidden = false
            popCancelBtn.isHidden = false
            popOkBtn.isHidden = false
            popTableview.isHidden = true
        } else if itemName == "TIME CLOCK"{
            let clackInOutVC = self.storyboard?.instantiateViewController(withIdentifier: "ClockInOutViewController") as! ClockInOutViewController

            self.navigationController?.pushViewController(clackInOutVC, animated:true)
        }else if itemName == "KITCHEN DISPLAY SCREEN"{
            let clackInOutVC = self.storyboard?.instantiateViewController(withIdentifier: "KichenDispalyVC") as! KichenDispalyVC

            self.navigationController?.pushViewController(clackInOutVC, animated:true)
        }else if itemName == "LOOKUP CUSTOMER"{
            let clackInOutVC = self.storyboard?.instantiateViewController(withIdentifier: "LookUpCustomerVC") as! LookUpCustomerVC

            self.navigationController?.pushViewController(clackInOutVC, animated:true)
        }else if itemName == "SHIFT REVIEW "{
            let employeShiftVc = self.storyboard?.instantiateViewController(withIdentifier: "EmployeShiftReviewVC") as! EmployeShiftReviewVC
            self.navigationController?.pushViewController(employeShiftVc, animated:true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == popTableview {
            return self.cashDrawersArr.count
        }else{
        return headerNamesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ListTableview {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell", for: indexPath) as! ListTableCell
        
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.shadowOffset = CGSize(width: 01, height: 03)
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.5
        cell.backView.layer.shadowRadius = 4
        cell.selectionStyle = .none
        cell.headerLabel.text = headerNamesArray[indexPath.row]
        cell.delegate = self
        
        if indexPath.row == 0 {
            cell.reloadCollectionView(array1: modeArray as Array<AnyObject>)
            cell.reloadCollectionView2(imgArray1: modeImgsArray as Array<AnyObject>)
        } else if indexPath.row == 1 {
            cell.reloadCollectionView(array1: managerActivityArray as Array<AnyObject>)
            cell.reloadCollectionView2(imgArray1: managerActivityImgsArray as Array<AnyObject>)
        } else if indexPath.row == 2 {
            cell.reloadCollectionView(array1: cashManagmentArray as Array<AnyObject>)
           cell.reloadCollectionView2(imgArray1: cashManagmentImgsArray as Array<AnyObject>)
        } else if indexPath.row == 3 {
            cell.reloadCollectionView(array1: reportsArray as Array<AnyObject>)
            cell.reloadCollectionView2(imgArray1: reportsImgsArray as Array<AnyObject>)
        } else if indexPath.row == 4 {
            cell.reloadCollectionView(array1: myAccountArray as Array<AnyObject>)
            cell.reloadCollectionView2(imgArray1: myAccountImgsArray as Array<AnyObject>)
        } else if indexPath.row == 5 {
            cell.reloadCollectionView(array1: supportArray as Array<AnyObject>)
           cell.reloadCollectionView2(imgArray1: supportImgsArray as Array<AnyObject>)
        } else if indexPath.row == 6 {
            cell.reloadCollectionView(array1: setUpArray as Array<AnyObject>)
           cell.reloadCollectionView2(imgArray1: setUpImgsArray as Array<AnyObject>)
        } else {
            return UITableViewCell()
        }
        cell.ListCollectionView.reloadData()
        return cell
        } else {
            let cell = popTableview.dequeueReusableCell(withIdentifier: "CashDrawerPayOutListCell", for: indexPath) as! CashDrawerPayOutListCell
            
            let data = self.cashDrawersArr[indexPath.row] as! [String:AnyObject]
            
            let name = self.themes.checkNullValue(data["cashDrawerName"] as AnyObject) as! String
            let  cashDrawerBalnce = self.themes.checkNullValue(data["cashDrawerBalnce"] as AnyObject) as! String
            let cashDrawer = self.themes.checkNullValue(data["cashDrawer"] as AnyObject) as! String

            cell.name_id_amount_LBL.text = "\(name)  (\(cashDrawer)) ( $\(cashDrawerBalnce)) "
                        
         return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == popTableview{
             let data = self.cashDrawersArr[indexPath.row] as! [String:AnyObject]
             let name = self.themes.checkNullValue(data["cashDrawerName"] as AnyObject) as! String
             let id = self.themes.checkNullValue(data["id"] as AnyObject) as! String
             cashdrawerID = id
             selectDrawerLabel.text = name
            
         //   hideView.isHidden = true
               //   popUpView.isHidden = true
                //  popCancelBtn.isHidden = true
                //  popOkBtn.isHidden = true
                  popTableview.isHidden = true
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == ListTableview{
        return 260
        }else{
            return tableView.estimatedRowHeight
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
        
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (commentsTextView?.text == "Enter Your Comment")

        {
            commentsTextView!.text = nil
            commentsTextView!.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if commentsTextView!.text.isEmpty
        {
            commentsTextView!.text = "Enter Your Comment"
            commentsTextView!.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()
    }
    
//    func View_CashDrawersAPI(restaurantId:String) {
//                   let networkRechability = urlService.connectedToNetwork()
//                   if(networkRechability){
//                       themes.showActivityIndicator(uiView: self.view)
//                    let id = self.themes.getUserId()!
//                       var parameters = [String:AnyObject]()
//                       parameters =  ["userId":id,
//                         "restaurantId":restaurantId] as [String : AnyObject]
//                       print("parameters is \(parameters)")
//                       urlService.serviceCallPostMethodWithParams(url:view_cashdrawers , params: parameters as Dictionary<String, AnyObject>) { response,error  in
//                           print(response)
//                       self.themes.hideActivityIndicator(uiView: self.view)
//                       let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
//                      if(success == "1") {
//
//                        self.cashDrawersArr = response["cashdrawers"] as! [AnyObject]
//
//                        self.popTableview.delegate = self
//                        self.popTableview.dataSource = self
//                        self.popTableview.reloadData()
//
//                      } else {
//
//                       }
//                     }
//               } else {
//                       self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
//                      }
//           }
    
    func add_payoutAPI( restaurantId:String,actionType:String,transactionType:String,action:String,amount:String,comment:String,cashDrawerId:String,createdBy:String,status:Int) {
                  let networkRechability = urlService.connectedToNetwork()
                  if(networkRechability){
                      themes.showActivityIndicator(uiView: self.view)
      //             let id = self.themes.getUserId()!
                      var parameters = [String:AnyObject]()
                      parameters =  ["actionType":actionType,
                      "transactionType":transactionType,
                      "action":action,
                      "amount":amount,
                      "comment":comment,
                      "cashDrawersId":cashDrawerId,
                      "createdBy":createdBy,
                      "restaurantId":restaurantId,
                      "status":status] as [String : AnyObject]
                      print("parameters is \(parameters)")
                      urlService.serviceCallPostMethodWithParams(url:add_payout, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                          print(response)
                      self.themes.hideActivityIndicator(uiView: self.view)
                      let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                     if(success == "1") {
                      let msg =  self.themes.checkNullValue(response["result"] as AnyObject) as! String

                        self.themes.showToast(message: msg, sender: self)

                        self.hideView.isHidden = true
                        self.popUpView.isHidden = true
                        self.popCancelBtn.isHidden = true
                        self.popOkBtn.isHidden = true
                        self.popTableview.isHidden = true
                    
                     } else {
                        let msg =  self.themes.checkNullValue(response["result"] as AnyObject) as! String
                         self.themes.showToast(message: msg, sender: self)
                      }
                    }
               } else {
                      self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                     }
          }
    
    func Active_CashDrawers( restaurantId:String) {
                let networkRechability = urlService.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
                 let id = self.themes.getUserId()!
                    var parameters = [String:AnyObject]()
            parameters =  [ "restaurantId":restaurantId,
                    "employeeId":id] as [String : AnyObject]
                    print("parameters is \(parameters)")
                    urlService.serviceCallPostMethodWithParams(url:get_all_cash_drawers_lists , params: parameters as Dictionary<String, AnyObject>) { response,error  in
                        print(response)
                    self.themes.hideActivityIndicator(uiView: self.view)
                    let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                   if(success == "1") {
                    let active_CashDrawersArr = response["cashdrawersActiveList"] as! [AnyObject]
                    let open_CashDrawersArr = response["cashdrawersOpenList"] as! [AnyObject]
                    let close_CashDrawersArr = response["cashdrawersClosedList"] as! [AnyObject]

            self.cashDrawersArr = active_CashDrawersArr + open_CashDrawersArr + close_CashDrawersArr
                    self.popTableview.delegate = self
                    self.popTableview.dataSource = self
                    self.popTableview.reloadData()
                   } else {

                    }
                  }
            } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                   }
        }
    }

extension UITextField {

enum PaddingSpace {
    case left(CGFloat)
    case right(CGFloat)
    case equalSpacing(CGFloat)
}

func addPadding(padding: PaddingSpace) {

    self.leftViewMode = .always
    self.layer.masksToBounds = true

    switch padding {

    case .left(let spacing):
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always

    case .right(let spacing):
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        self.rightView = rightPaddingView
        self.rightViewMode = .always

    case .equalSpacing(let spacing):
        let equalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        // left
        self.leftView = equalPaddingView
        self.leftViewMode = .always
        // right
        self.rightView = equalPaddingView
        self.rightViewMode = .always
    }
  }
}
   

                  
    

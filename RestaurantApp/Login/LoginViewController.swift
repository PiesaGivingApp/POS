//
//  LoginViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 30/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var themes = Themes()
    var urlSer = URLservices.sharedInstance
    
    var passCode = ""
    
    @IBOutlet var logBtnBackView: UIView!
    @IBOutlet var passcodeBackImg: UIImageView!
    @IBOutlet var passcodeImage: UIImageView!
    @IBOutlet var pascodeLbl: UILabel!
    
    @IBOutlet var userNameBackImg: UIImageView!
    @IBOutlet var uiserNameImage: UIImageView!
    @IBOutlet var userNameLbl: UILabel!
        
    @IBOutlet var userNameBackView: UIView!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var passcodeBackView: UIView!
    @IBOutlet var passCodeTf1: UITextField!
    @IBOutlet var passCodeTf2: UITextField!
    @IBOutlet var passCodeTf3: UITextField!
    @IBOutlet var passCodeTf4: UITextField!
    @IBOutlet var passCodeTf5: UITextField!
    @IBOutlet var passCodeTf6: UITextField!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    @IBOutlet var button0: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameBackView.isHidden = true
        
        passCodeTf1.layer.borderWidth = 0.5
        passCodeTf1.layer.borderColor = buttonBorderColor.cgColor
        passCodeTf2.layer.borderWidth = 0.5
        passCodeTf2.layer.borderColor = buttonBorderColor.cgColor
        passCodeTf3.layer.borderWidth = 0.5
        passCodeTf3.layer.borderColor = buttonBorderColor.cgColor
        passCodeTf4.layer.borderWidth = 0.5
        passCodeTf4.layer.borderColor = buttonBorderColor.cgColor
        passCodeTf5.layer.borderWidth = 0.5
        passCodeTf5.layer.borderColor = buttonBorderColor.cgColor
        passCodeTf6.layer.borderWidth = 0.5
        passCodeTf6.layer.borderColor = buttonBorderColor.cgColor
        button0.layer.borderWidth = 1
        button0.layer.borderColor = buttonBorderColor.cgColor
        button1.layer.borderWidth = 0.5
        button1.layer.borderColor = buttonBorderColor.cgColor
        button2.layer.borderWidth = 0.5
        button2.layer.borderColor = buttonBorderColor.cgColor
        button3.layer.borderWidth = 0.5
        button3.layer.borderColor = buttonBorderColor.cgColor
        button4.layer.borderWidth = 0.5
        button4.layer.borderColor = buttonBorderColor.cgColor
        button5.layer.borderWidth = 0.5
        button5.layer.borderColor = buttonBorderColor.cgColor
        button6.layer.borderWidth = 0.5
        button6.layer.borderColor = buttonBorderColor.cgColor
        button7.layer.borderWidth = 0.5
        button7.layer.borderColor = buttonBorderColor.cgColor
        button8.layer.borderWidth = 0.5
        button8.layer.borderColor = buttonBorderColor.cgColor
        button9.layer.borderWidth = 0.5
        button9.layer.borderColor = buttonBorderColor.cgColor
        userNameTextField.layer.borderWidth = 0.5
        userNameTextField.layer.borderColor = buttonBorderColor.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = buttonBorderColor.cgColor
        
        shadowToView(view: logBtnBackView)
        // Do any additional setup after loading the view.
    }
    
    func shadowToView(view:UIView){
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 1, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
       }
    
    @IBAction func numbersAction(_ sender: UIButton) {
                       
                       if passCodeTf1.text == "" {
                           passCodeTf1.text = String(sender.tag-1)
                       } else if passCodeTf2.text == "" {
                           passCodeTf2.text = String(sender.tag-1)
                       } else if passCodeTf3.text == "" {
                           passCodeTf3.text = String(sender.tag-1)
                       } else if passCodeTf4.text == "" {
                           passCodeTf4.text = String(sender.tag-1)
                       } else if passCodeTf5.text == "" {
                           passCodeTf5.text = String(sender.tag-1)
                       } else if passCodeTf6.text == "" {
                           passCodeTf6.text = String(sender.tag-1)
                       }
                 
         let Code1 = passCodeTf1.text! + passCodeTf2.text! + passCodeTf3.text! + passCodeTf4.text!
         let Code2 = passCodeTf5.text! + passCodeTf6.text!
        self.passCode = Code1 + Code2
        if self.passCode.count == 6 {
            passcodeLogInApi(code: self.passCode, restarentId: restId)
        } else {
            
         }
    
       }
       
       @IBAction func cancelAction(_ sender: Any) {
           passCodeTf1.text = ""
           passCodeTf2.text = ""
           passCodeTf3.text = ""
           passCodeTf4.text = ""
           passCodeTf5.text = ""
           passCodeTf6.text = ""
           self.passCode = ""
       }

    @IBAction func passcodeAction(_ sender: Any) {
        userNameBackView.isHidden = true
        passcodeBackView.isHidden = false
        userNameBackImg.image = UIImage(named: "buttonWhiteBg")
        uiserNameImage.image = UIImage(named: "username_password_default")
        passcodeBackImg.image = UIImage(named: "buttonBackImg")
        passcodeImage.image = UIImage(named: "passcode_select")
        pascodeLbl.textColor = UIColor.white
        userNameLbl.textColor = UIColor.init(red: 155/255, green: 169/255, blue: 171/255, alpha: 1.0)
        passCodeTf1.text = ""
        passCodeTf2.text = ""
        passCodeTf3.text = ""
        passCodeTf4.text = ""
        passCodeTf5.text = ""
        passCodeTf6.text = ""
        self.passCode = ""
    }
    
    @IBAction func userNameAction(_ sender: Any) {
        userNameBackView.isHidden = false
        passcodeBackView.isHidden = true
        userNameBackImg.image = UIImage(named: "buttonBackImg")
        uiserNameImage.image = UIImage(named: "username_password select")
        passcodeBackImg.image = UIImage(named: "buttonWhiteBg")
        passcodeImage.image = UIImage(named: "passcode_defualt")
        pascodeLbl.textColor = UIColor.init(red: 155/255, green: 169/255, blue: 171/255, alpha: 1.0)
        userNameLbl.textColor = UIColor.white
    }
    
    func isValidEmail(_ email: String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: email)
       }
    
    func validatedFields() -> Bool{
       if(userNameTextField.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter your email.", sender: self)
                return false
            } else if(!(isValidEmail(userNameTextField.text!))){
                themes.showAlert(title: "Alert", message: "Please enter valid email.", sender: self)
                return false
            } else if(passwordTextField.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter Your Password.", sender: self)
                return false
            }
            return true
        }
            
    @IBAction func submitAction(_ sender: Any) {
        if validatedFields(){
            logInApi(email: userNameTextField.text!, password: passwordTextField.text!, restarentId: restId)
//            logInApi(email: "poornachand@gmail.com", password: "123456", restarentId: restId)
        } else {

        }

    }
    
    func passcodeLogInApi(code : String, restarentId:String)  {
                let networkRechability =  urlSer.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
              let parameters = ["passcode":code,"restaurantId":restarentId] as [String : AnyObject]
                    print(parameters)
                    urlSer.serviceCallPostMethodWithParams(url: login_passcode, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                                   print(response)
                                   self.themes.hideActivityIndicator(uiView: self.view)

                        let success = self.themes.checkNullValue(response["responseStatus"] as! AnyObject) as! String
                                   if(success == "1"){
                                    
                                    let result = response["userDetails"] as AnyObject
                                    let firstName = self.themes.checkNullValue(result["firstName"] as AnyObject) as! String
                                    let lastName = self.themes.checkNullValue(result["lastName"] as AnyObject) as! String
                                    let empId = self.themes.checkNullValue(result["empId"] as AnyObject) as! String
                                    let restarentId = self.themes.checkNullValue(result["restaurantId"] as AnyObject) as! String
    //                               let userName = self.themes.checkNullValue(result["userName"] as AnyObject) as! String
    //                               let email = self.themes.checkNullValue(result["email"] as AnyObject) as! String
                                    let id = self.themes.checkNullValue(result["id"] as AnyObject) as! String
                                    let profilePic = self.themes.checkNullValue(result["profilePic"] as AnyObject) as! String
              
                                    let permissionList = result["permissionList"] as! [String:AnyObject]
                                    
                                    let accountAdminAccess = permissionList["accountAdminAccess"] as AnyObject
                                    let dataExportConfig = self.themes.checkNullValue(accountAdminAccess["dataExportConfig"] as AnyObject) as! String
                                    let financialAccounts = self.themes.checkNullValue(accountAdminAccess["financialAccounts"] as AnyObject) as! String
                                    let manageIntegrations = self.themes.checkNullValue(accountAdminAccess["manageIntegrations"] as AnyObject) as! String
                                    let userPermissions = self.themes.checkNullValue(accountAdminAccess["userPermissions"] as AnyObject) as! String
                                    
                                    let deliveryAccess = permissionList["deliveryAccess"] as AnyObject
                                    let cancelDispatch = self.themes.checkNullValue(deliveryAccess["cancelDispatch"] as AnyObject) as! String
                                    let completeDelivery = self.themes.checkNullValue(deliveryAccess["completeDelivery"] as AnyObject) as! String
                                    let deliveryMode = self.themes.checkNullValue(deliveryAccess["deliveryMode"] as AnyObject) as! String
                                    let dispatchDriver = self.themes.checkNullValue(deliveryAccess["dispatchDriver"] as AnyObject) as! String
                                    let updateAllDeliveryOrders = self.themes.checkNullValue(deliveryAccess["updateAllDeliveryOrders"] as AnyObject) as! String
                                    let updateDriver = self.themes.checkNullValue(deliveryAccess["updateDriver"] as AnyObject) as! String
                                    
                                    let deviceSetupAccess = permissionList["deviceSetupAccess"] as AnyObject
                                    let advancedTerminalSetup = self.themes.checkNullValue(deviceSetupAccess["advancedTerminalSetup"] as AnyObject) as! String
                                    let kdsAndOrderScreenSetup = self.themes.checkNullValue(deviceSetupAccess["kdsAndOrderScreenSetup"] as AnyObject) as! String
                                    let terminalSetup = self.themes.checkNullValue(deviceSetupAccess["terminalSetup"] as AnyObject) as! String
                                    
                                    let managerAccess = permissionList["managerAccess"] as AnyObject
                                    let adjustCashDrawerStartBalance = self.themes.checkNullValue(deviceSetupAccess["adjustCashDrawerStartBalance"] as AnyObject) as! String
                                    let bulkClosePaidChecks = self.themes.checkNullValue(deviceSetupAccess["bulkClosePaidChecks"] as AnyObject) as! String
                                    let bulkTransferCheck = self.themes.checkNullValue(deviceSetupAccess["bulkTransferCheck"] as AnyObject) as! String
                                    let bulkVoidOpenChecks = self.themes.checkNullValue(deviceSetupAccess["bulkVoidOpenChecks"] as AnyObject) as! String
                                    let cashDrawerLockdown = self.themes.checkNullValue(deviceSetupAccess["cashDrawerLockdown"] as AnyObject) as! String
                                    let cashDrawersBlind = self.themes.checkNullValue(deviceSetupAccess["cashDrawersBlind"] as AnyObject) as! String
                                    let cashDrawersFull = self.themes.checkNullValue(deviceSetupAccess["cashDrawersFull"] as AnyObject) as! String
                                    let closeOutDay = self.themes.checkNullValue(deviceSetupAccess["closeOutDay"] as AnyObject) as! String
                                    let discounts = self.themes.checkNullValue(deviceSetupAccess["discounts"] as AnyObject) as! String
                                    let editSentItems = self.themes.checkNullValue(deviceSetupAccess["editSentItems"] as AnyObject) as! String
                                    let editTimeEntries = self.themes.checkNullValue(deviceSetupAccess["editTimeEntries"] as AnyObject) as! String
                                    let endBreaksEarly = self.themes.checkNullValue(deviceSetupAccess["endBreaksEarly"] as AnyObject) as! String
                                    let findChecks = self.themes.checkNullValue(deviceSetupAccess["findChecks"] as AnyObject) as! String
                                    let giftCardAdjustment = self.themes.checkNullValue(deviceSetupAccess["giftCardAdjustment"] as AnyObject) as! String
                                    let largeCashOverOrUnder = self.themes.checkNullValue(deviceSetupAccess["largeCashOverOrUnder"] as AnyObject) as! String
                                    let logBook = self.themes.checkNullValue(deviceSetupAccess["logBook"] as AnyObject) as! String
                                    let negativeDeclaredTips = self.themes.checkNullValue(deviceSetupAccess["negativeDeclaredTips"] as AnyObject) as! String
                                    let openItems = self.themes.checkNullValue(deviceSetupAccess["openItems"] as AnyObject) as! String
                                    let otherPaymentTypes = self.themes.checkNullValue(deviceSetupAccess["otherPaymentTypes"] as AnyObject) as! String
                                    let payout = self.themes.checkNullValue(deviceSetupAccess["payout"] as AnyObject) as! String
                                    let registerSwipeCards = self.themes.checkNullValue(deviceSetupAccess["registerSwipeCards"] as AnyObject) as! String
                                    let sendNotifications = self.themes.checkNullValue(deviceSetupAccess["sendNotifications"] as AnyObject) as! String
                                    let shiftReview = self.themes.checkNullValue(deviceSetupAccess["shiftReview"] as AnyObject) as! String
                                    let taxExempt = self.themes.checkNullValue(deviceSetupAccess["taxExempt"] as AnyObject) as! String
                                    let throttleOnlineOrders = self.themes.checkNullValue(deviceSetupAccess["throttleOnlineOrders"] as AnyObject) as! String
                                    let transferOrRewardsAdjustment = self.themes.checkNullValue(deviceSetupAccess["transferOrRewardsAdjustment"] as AnyObject) as! String
                                    let unlinkedRefunds = self.themes.checkNullValue(deviceSetupAccess["unlinkedRefunds"] as AnyObject) as! String
                                    let voidItemOrOrders = self.themes.checkNullValue(deviceSetupAccess["voidItemOrOrders"] as AnyObject) as! String
                                    let voidOrRefundPayments = self.themes.checkNullValue(deviceSetupAccess["voidOrRefundPayments"] as AnyObject) as! String
                                    
                                    let posAccess = permissionList["posAccess"] as AnyObject
                                    let addOrUpdateServiceCharges = self.themes.checkNullValue(posAccess["addOrUpdateServiceCharges"] as AnyObject) as! String
                                    let applyCashPayments = self.themes.checkNullValue(posAccess["applyCashPayments"] as AnyObject) as! String
                                    let cashDrawerAccess = self.themes.checkNullValue(posAccess["cashDrawerAccess"] as AnyObject) as! String
                                    let changeServer = self.themes.checkNullValue(posAccess["changeServer"] as AnyObject) as! String
                                    let changeTable = self.themes.checkNullValue(posAccess["changeTable"] as AnyObject) as! String
                                    let editOtherEmployeesOrders = self.themes.checkNullValue(posAccess["editOtherEmployeesOrders"] as AnyObject) as! String
                                    let keyInCreditCards = self.themes.checkNullValue(posAccess["keyInCreditCards"] as AnyObject) as! String
                                    let kitchenDisplayScreenMode = self.themes.checkNullValue(posAccess["kitchenDisplayScreenMode"] as AnyObject) as! String
                                    let myReports = self.themes.checkNullValue(deviceSetupAccess["myReports"] as AnyObject) as! String
                                    let noSale = self.themes.checkNullValue(deviceSetupAccess["noSale"] as AnyObject) as! String
                                    let offlineOrBackgroundCreditCardProcessing = self.themes.checkNullValue(deviceSetupAccess["offlineOrBackgroundCreditCardProcessing"] as AnyObject) as! String
                                    let pandingOrdersMode = self.themes.checkNullValue(deviceSetupAccess["pandingOrdersMode"] as AnyObject) as! String
                                    let paymentTerminalMode = self.themes.checkNullValue(deviceSetupAccess["paymentTerminalMode"] as AnyObject) as! String
                                    let quickOrderMode = self.themes.checkNullValue(deviceSetupAccess["quickOrderMode"] as AnyObject) as! String
                                    let shiftReviewSalesData = self.themes.checkNullValue(deviceSetupAccess["shiftReviewSalesData"] as AnyObject) as! String
                                    let tableServiceMode = self.themes.checkNullValue(deviceSetupAccess["tableServiceMode"] as AnyObject) as! String
                                    let viewOtherEmployeesOrders = self.themes.checkNullValue(deviceSetupAccess["viewOtherEmployeesOrders"] as AnyObject) as! String
                                  
                                    let quickEditAccess = permissionList["quickEditAccess"] as AnyObject
                                    let addExistingItemsOrMods = self.themes.checkNullValue(quickEditAccess["addExistingItemsOrMods"] as AnyObject) as! String
                                    let addNewItemsMods = self.themes.checkNullValue(quickEditAccess["addNewItemsMods"] as AnyObject) as! String
                                    let buttonColor = self.themes.checkNullValue(quickEditAccess["buttonColor"] as AnyObject) as! String
                                    let fullQuickEdit = self.themes.checkNullValue(quickEditAccess["fullQuickEdit"] as AnyObject) as! String
                                    let inventoryAndQuantity = self.themes.checkNullValue(quickEditAccess["inventoryAndQuantity"] as AnyObject) as! String
                                    let name = self.themes.checkNullValue(quickEditAccess["name"] as AnyObject) as! String
                                    let posName = self.themes.checkNullValue(quickEditAccess["posName"] as AnyObject) as! String
                                    let price = self.themes.checkNullValue(quickEditAccess["price"] as AnyObject) as! String
                                    let rearrangingItemsMods = self.themes.checkNullValue(quickEditAccess["rearrangingItemsMods"] as AnyObject) as! String
                                    let removeItemsOrMods = self.themes.checkNullValue(quickEditAccess["removeItemsOrMods"] as AnyObject) as! String
                                    let sku = self.themes.checkNullValue(quickEditAccess["sku"] as AnyObject) as! String
                                  
                                    let restaurantAdminAccess = permissionList["restaurantAdminAccess"] as AnyObject
                                    let customersCreditsAndReports = self.themes.checkNullValue(restaurantAdminAccess["customersCreditsAndReports"] as AnyObject) as! String
                                    let editFullMenu = self.themes.checkNullValue(restaurantAdminAccess["editFullMenu"] as AnyObject) as! String
                                    let editHistoricalData = self.themes.checkNullValue(restaurantAdminAccess["editHistoricalData"] as AnyObject) as! String
                                    let employeeInfo = self.themes.checkNullValue(restaurantAdminAccess["employeeInfo"] as AnyObject) as! String
                                    let employeeJobsAndWages = self.themes.checkNullValue(restaurantAdminAccess["employeeJobsAndWages"] as AnyObject) as! String
                                    let giftOrRewardsCardReport = self.themes.checkNullValue(restaurantAdminAccess["giftOrRewardsCardReport"] as AnyObject) as! String
                                    let houseAccounts = self.themes.checkNullValue(restaurantAdminAccess["houseAccounts"] as AnyObject) as! String
                                    let laborReports = self.themes.checkNullValue(restaurantAdminAccess["laborReports"] as AnyObject) as! String
                                    let localMenuEdit = self.themes.checkNullValue(restaurantAdminAccess["localMenuEdit"] as AnyObject) as! String
                                    let marketingInfo = self.themes.checkNullValue(restaurantAdminAccess["marketingInfo"] as AnyObject) as! String
                                    let menuReports = self.themes.checkNullValue(restaurantAdminAccess["menuReports"] as AnyObject) as! String
                                    let salesReports = self.themes.checkNullValue(restaurantAdminAccess["salesReports"] as AnyObject) as! String
                                    let tables = self.themes.checkNullValue(restaurantAdminAccess["tables"] as AnyObject) as! String
                                    
                                    let webSetupAccess = permissionList["webSetupAccess"] as AnyObject
                                    let dataExportConfig2 = self.themes.checkNullValue(webSetupAccess["dataExportConfig"] as AnyObject) as! String
                                    let discountsSetup = self.themes.checkNullValue(webSetupAccess["discountsSetup"] as AnyObject) as! String
                                    let financialAccounts2 = self.themes.checkNullValue(webSetupAccess["financialAccounts"] as AnyObject) as! String
                                    let kitchenOrDiningRoomSetup = self.themes.checkNullValue(webSetupAccess["kitchenOrDiningRoomSetup"] as AnyObject) as! String
                                    let manageInstructions = self.themes.checkNullValue(webSetupAccess["manageInstructions"] as AnyObject) as! String
                                    let paymentsSetup = self.themes.checkNullValue(webSetupAccess["paymentsSetup"] as AnyObject) as! String
                                    let publishing = self.themes.checkNullValue(webSetupAccess["publishing"] as AnyObject) as! String
                                    let restaurantGroupsSetup = self.themes.checkNullValue(webSetupAccess["restaurantGroupsSetup"] as AnyObject) as! String
                                    let restaurantOperationsSetup = self.themes.checkNullValue(restaurantAdminAccess["restaurantOperationsSetup"] as AnyObject) as! String
                                    let taxRatesSetup = self.themes.checkNullValue(restaurantAdminAccess["taxRatesSetup"] as AnyObject) as! String
                                    let userPermissions2 = self.themes.checkNullValue(restaurantAdminAccess["userPermissions"] as AnyObject) as! String
                                    
                                    self.themes.saveUserId(id)
                                    self.themes.saveFirstName(firstName)
                                    self.themes.saveLastName(lastName)
                                    self.themes.saveEmployId(empId)
                                    self.themes.saveRestarentId(restarentId)
    //                                self.themes.saveUserName(userName)
    //                                self.themes.saveUserEmail(email)
                                    self.themes.saveUserProfilePic(profilePic)
                                    
                                    let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                    self.navigationController?.pushViewController(homeVc, animated: true)

                                   } else {
                                    self.themes.hideActivityIndicator(uiView: self.view)
                                    self.passCodeTf1.text = ""
                                    self.passCodeTf2.text = ""
                                    self.passCodeTf3.text = ""
                                    self.passCodeTf4.text = ""
                                    self.passCodeTf5.text = ""
                                    self.passCodeTf6.text = ""
                                    self.passCode = ""
                                    let msg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                                    self.themes.showAlert(title: "Oops ☹️", message: msg, sender: self)

                                   }
                               }
                           } else {
                               self.themes.hideActivityIndicator(uiView: self.view)
                               themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                           }
                           
                       }
                    
    func logInApi(email : String, password: String, restarentId:String)  {
            let networkRechability =  urlSer.connectedToNetwork()
            if(networkRechability){
                themes.showActivityIndicator(uiView: self.view)
            let parameters = ["email":email,"password":password,"restaurantId":restarentId] as [String : AnyObject]
                urlSer.serviceCallPostMethodWithParams(url: login, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                               print(response)
                               self.themes.hideActivityIndicator(uiView: self.view)

                    let success = self.themes.checkNullValue(response["responseStatus"] as! AnyObject) as! String
                               if(success == "1"){
                                
                                let result = response["userDetails"] as AnyObject
                                let firstName = self.themes.checkNullValue(result["firstName"] as AnyObject) as! String
                                let lastName = self.themes.checkNullValue(result["lastName"] as AnyObject) as! String
                                let empId = self.themes.checkNullValue(result["empId"] as AnyObject) as! String
                                let restarentId = self.themes.checkNullValue(result["restaurantId"] as AnyObject) as! String
//                               let userName = self.themes.checkNullValue(result["userName"] as AnyObject) as! String
//                               let email = self.themes.checkNullValue(result["email"] as AnyObject) as! String
                                let id = self.themes.checkNullValue(result["id"] as AnyObject) as! String
                                let profilePic = self.themes.checkNullValue(result["profilePic"] as AnyObject) as! String
          
                                let permissionList = result["permissionList"] as! [String:AnyObject]
                                
                                let accountAdminAccess = permissionList["accountAdminAccess"] as AnyObject
                                let dataExportConfig = self.themes.checkNullValue(accountAdminAccess["dataExportConfig"] as AnyObject) as! String
                                let financialAccounts = self.themes.checkNullValue(accountAdminAccess["financialAccounts"] as AnyObject) as! String
                                let manageIntegrations = self.themes.checkNullValue(accountAdminAccess["manageIntegrations"] as AnyObject) as! String
                                let userPermissions = self.themes.checkNullValue(accountAdminAccess["userPermissions"] as AnyObject) as! String
                                
                                let deliveryAccess = permissionList["deliveryAccess"] as AnyObject
                                let cancelDispatch = self.themes.checkNullValue(deliveryAccess["cancelDispatch"] as AnyObject) as! String
                                let completeDelivery = self.themes.checkNullValue(deliveryAccess["completeDelivery"] as AnyObject) as! String
                                let deliveryMode = self.themes.checkNullValue(deliveryAccess["deliveryMode"] as AnyObject) as! String
                                let dispatchDriver = self.themes.checkNullValue(deliveryAccess["dispatchDriver"] as AnyObject) as! String
                                let updateAllDeliveryOrders = self.themes.checkNullValue(deliveryAccess["updateAllDeliveryOrders"] as AnyObject) as! String
                                let updateDriver = self.themes.checkNullValue(deliveryAccess["updateDriver"] as AnyObject) as! String
                                
                                let deviceSetupAccess = permissionList["deviceSetupAccess"] as AnyObject
                                let advancedTerminalSetup = self.themes.checkNullValue(deviceSetupAccess["advancedTerminalSetup"] as AnyObject) as! String
                                let kdsAndOrderScreenSetup = self.themes.checkNullValue(deviceSetupAccess["kdsAndOrderScreenSetup"] as AnyObject) as! String
                                let terminalSetup = self.themes.checkNullValue(deviceSetupAccess["terminalSetup"] as AnyObject) as! String
                                
                                let managerAccess = permissionList["managerAccess"] as AnyObject
                                let adjustCashDrawerStartBalance = self.themes.checkNullValue(deviceSetupAccess["adjustCashDrawerStartBalance"] as AnyObject) as! String
                                let bulkClosePaidChecks = self.themes.checkNullValue(deviceSetupAccess["bulkClosePaidChecks"] as AnyObject) as! String
                                let bulkTransferCheck = self.themes.checkNullValue(deviceSetupAccess["bulkTransferCheck"] as AnyObject) as! String
                                let bulkVoidOpenChecks = self.themes.checkNullValue(deviceSetupAccess["bulkVoidOpenChecks"] as AnyObject) as! String
                                let cashDrawerLockdown = self.themes.checkNullValue(deviceSetupAccess["cashDrawerLockdown"] as AnyObject) as! String
                                let cashDrawersBlind = self.themes.checkNullValue(deviceSetupAccess["cashDrawersBlind"] as AnyObject) as! String
                                let cashDrawersFull = self.themes.checkNullValue(deviceSetupAccess["cashDrawersFull"] as AnyObject) as! String
                                let closeOutDay = self.themes.checkNullValue(deviceSetupAccess["closeOutDay"] as AnyObject) as! String
                                let discounts = self.themes.checkNullValue(deviceSetupAccess["discounts"] as AnyObject) as! String
                                let editSentItems = self.themes.checkNullValue(deviceSetupAccess["editSentItems"] as AnyObject) as! String
                                let editTimeEntries = self.themes.checkNullValue(deviceSetupAccess["editTimeEntries"] as AnyObject) as! String
                                let endBreaksEarly = self.themes.checkNullValue(deviceSetupAccess["endBreaksEarly"] as AnyObject) as! String
                                let findChecks = self.themes.checkNullValue(deviceSetupAccess["findChecks"] as AnyObject) as! String
                                let giftCardAdjustment = self.themes.checkNullValue(deviceSetupAccess["giftCardAdjustment"] as AnyObject) as! String
                                let largeCashOverOrUnder = self.themes.checkNullValue(deviceSetupAccess["largeCashOverOrUnder"] as AnyObject) as! String
                                let logBook = self.themes.checkNullValue(deviceSetupAccess["logBook"] as AnyObject) as! String
                                let negativeDeclaredTips = self.themes.checkNullValue(deviceSetupAccess["negativeDeclaredTips"] as AnyObject) as! String
                                let openItems = self.themes.checkNullValue(deviceSetupAccess["openItems"] as AnyObject) as! String
                                let otherPaymentTypes = self.themes.checkNullValue(deviceSetupAccess["otherPaymentTypes"] as AnyObject) as! String
                                let payout = self.themes.checkNullValue(deviceSetupAccess["payout"] as AnyObject) as! String
                                let registerSwipeCards = self.themes.checkNullValue(deviceSetupAccess["registerSwipeCards"] as AnyObject) as! String
                                let sendNotifications = self.themes.checkNullValue(deviceSetupAccess["sendNotifications"] as AnyObject) as! String
                                let shiftReview = self.themes.checkNullValue(deviceSetupAccess["shiftReview"] as AnyObject) as! String
                                let taxExempt = self.themes.checkNullValue(deviceSetupAccess["taxExempt"] as AnyObject) as! String
                                let throttleOnlineOrders = self.themes.checkNullValue(deviceSetupAccess["throttleOnlineOrders"] as AnyObject) as! String
                                let transferOrRewardsAdjustment = self.themes.checkNullValue(deviceSetupAccess["transferOrRewardsAdjustment"] as AnyObject) as! String
                                let unlinkedRefunds = self.themes.checkNullValue(deviceSetupAccess["unlinkedRefunds"] as AnyObject) as! String
                                let voidItemOrOrders = self.themes.checkNullValue(deviceSetupAccess["voidItemOrOrders"] as AnyObject) as! String
                                let voidOrRefundPayments = self.themes.checkNullValue(deviceSetupAccess["voidOrRefundPayments"] as AnyObject) as! String
                                
                                let posAccess = permissionList["posAccess"] as AnyObject
                                let addOrUpdateServiceCharges = self.themes.checkNullValue(posAccess["addOrUpdateServiceCharges"] as AnyObject) as! String
                                let applyCashPayments = self.themes.checkNullValue(posAccess["applyCashPayments"] as AnyObject) as! String
                                let cashDrawerAccess = self.themes.checkNullValue(posAccess["cashDrawerAccess"] as AnyObject) as! String
                                let changeServer = self.themes.checkNullValue(posAccess["changeServer"] as AnyObject) as! String
                                let changeTable = self.themes.checkNullValue(posAccess["changeTable"] as AnyObject) as! String
                                let editOtherEmployeesOrders = self.themes.checkNullValue(posAccess["editOtherEmployeesOrders"] as AnyObject) as! String
                                let keyInCreditCards = self.themes.checkNullValue(posAccess["keyInCreditCards"] as AnyObject) as! String
                                let kitchenDisplayScreenMode = self.themes.checkNullValue(posAccess["kitchenDisplayScreenMode"] as AnyObject) as! String
                                let myReports = self.themes.checkNullValue(deviceSetupAccess["myReports"] as AnyObject) as! String
                                let noSale = self.themes.checkNullValue(deviceSetupAccess["noSale"] as AnyObject) as! String
                                let offlineOrBackgroundCreditCardProcessing = self.themes.checkNullValue(deviceSetupAccess["offlineOrBackgroundCreditCardProcessing"] as AnyObject) as! String
                                let pandingOrdersMode = self.themes.checkNullValue(deviceSetupAccess["pandingOrdersMode"] as AnyObject) as! String
                                let paymentTerminalMode = self.themes.checkNullValue(deviceSetupAccess["paymentTerminalMode"] as AnyObject) as! String
                                let quickOrderMode = self.themes.checkNullValue(deviceSetupAccess["quickOrderMode"] as AnyObject) as! String
                                let shiftReviewSalesData = self.themes.checkNullValue(deviceSetupAccess["shiftReviewSalesData"] as AnyObject) as! String
                                let tableServiceMode = self.themes.checkNullValue(deviceSetupAccess["tableServiceMode"] as AnyObject) as! String
                                let viewOtherEmployeesOrders = self.themes.checkNullValue(deviceSetupAccess["viewOtherEmployeesOrders"] as AnyObject) as! String
                              
                                let quickEditAccess = permissionList["quickEditAccess"] as AnyObject
                                let addExistingItemsOrMods = self.themes.checkNullValue(quickEditAccess["addExistingItemsOrMods"] as AnyObject) as! String
                                let addNewItemsMods = self.themes.checkNullValue(quickEditAccess["addNewItemsMods"] as AnyObject) as! String
                                let buttonColor = self.themes.checkNullValue(quickEditAccess["buttonColor"] as AnyObject) as! String
                                let fullQuickEdit = self.themes.checkNullValue(quickEditAccess["fullQuickEdit"] as AnyObject) as! String
                                let inventoryAndQuantity = self.themes.checkNullValue(quickEditAccess["inventoryAndQuantity"] as AnyObject) as! String
                                let name = self.themes.checkNullValue(quickEditAccess["name"] as AnyObject) as! String
                                let posName = self.themes.checkNullValue(quickEditAccess["posName"] as AnyObject) as! String
                                let price = self.themes.checkNullValue(quickEditAccess["price"] as AnyObject) as! String
                                let rearrangingItemsMods = self.themes.checkNullValue(quickEditAccess["rearrangingItemsMods"] as AnyObject) as! String
                                let removeItemsOrMods = self.themes.checkNullValue(quickEditAccess["removeItemsOrMods"] as AnyObject) as! String
                                let sku = self.themes.checkNullValue(quickEditAccess["sku"] as AnyObject) as! String
                              
                                let restaurantAdminAccess = permissionList["restaurantAdminAccess"] as AnyObject
                                let customersCreditsAndReports = self.themes.checkNullValue(restaurantAdminAccess["customersCreditsAndReports"] as AnyObject) as! String
                                let editFullMenu = self.themes.checkNullValue(restaurantAdminAccess["editFullMenu"] as AnyObject) as! String
                                let editHistoricalData = self.themes.checkNullValue(restaurantAdminAccess["editHistoricalData"] as AnyObject) as! String
                                let employeeInfo = self.themes.checkNullValue(restaurantAdminAccess["employeeInfo"] as AnyObject) as! String
                                let employeeJobsAndWages = self.themes.checkNullValue(restaurantAdminAccess["employeeJobsAndWages"] as AnyObject) as! String
                                let giftOrRewardsCardReport = self.themes.checkNullValue(restaurantAdminAccess["giftOrRewardsCardReport"] as AnyObject) as! String
                                let houseAccounts = self.themes.checkNullValue(restaurantAdminAccess["houseAccounts"] as AnyObject) as! String
                                let laborReports = self.themes.checkNullValue(restaurantAdminAccess["laborReports"] as AnyObject) as! String
                                let localMenuEdit = self.themes.checkNullValue(restaurantAdminAccess["localMenuEdit"] as AnyObject) as! String
                                let marketingInfo = self.themes.checkNullValue(restaurantAdminAccess["marketingInfo"] as AnyObject) as! String
                                let menuReports = self.themes.checkNullValue(restaurantAdminAccess["menuReports"] as AnyObject) as! String
                                let salesReports = self.themes.checkNullValue(restaurantAdminAccess["salesReports"] as AnyObject) as! String
                                let tables = self.themes.checkNullValue(restaurantAdminAccess["tables"] as AnyObject) as! String
                                
                                let webSetupAccess = permissionList["webSetupAccess"] as AnyObject
                                let dataExportConfig2 = self.themes.checkNullValue(webSetupAccess["dataExportConfig"] as AnyObject) as! String
                                let discountsSetup = self.themes.checkNullValue(webSetupAccess["discountsSetup"] as AnyObject) as! String
                                let financialAccounts2 = self.themes.checkNullValue(webSetupAccess["financialAccounts"] as AnyObject) as! String
                                let kitchenOrDiningRoomSetup = self.themes.checkNullValue(webSetupAccess["kitchenOrDiningRoomSetup"] as AnyObject) as! String
                                let manageInstructions = self.themes.checkNullValue(webSetupAccess["manageInstructions"] as AnyObject) as! String
                                let paymentsSetup = self.themes.checkNullValue(webSetupAccess["paymentsSetup"] as AnyObject) as! String
                                let publishing = self.themes.checkNullValue(webSetupAccess["publishing"] as AnyObject) as! String
                                let restaurantGroupsSetup = self.themes.checkNullValue(webSetupAccess["restaurantGroupsSetup"] as AnyObject) as! String
                                let restaurantOperationsSetup = self.themes.checkNullValue(restaurantAdminAccess["restaurantOperationsSetup"] as AnyObject) as! String
                                let taxRatesSetup = self.themes.checkNullValue(restaurantAdminAccess["taxRatesSetup"] as AnyObject) as! String
                                let userPermissions2 = self.themes.checkNullValue(restaurantAdminAccess["userPermissions"] as AnyObject) as! String
                                
                                self.themes.saveUserId(id)
                                self.themes.saveFirstName(firstName)
                                self.themes.saveLastName(lastName)
                                self.themes.saveEmployId(empId)
                                self.themes.saveRestarentId(restarentId)
//                                self.themes.saveUserName(userName)
//                                self.themes.saveUserEmail(email)
                                self.themes.saveUserProfilePic(profilePic)
                                
                                let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                self.navigationController?.pushViewController(homeVc, animated: true)

                               } else {
                                self.themes.hideActivityIndicator(uiView: self.view)
                                let msg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                                self.themes.showAlert(title: "Oops ☹️", message: msg, sender: self)

                               }
                           }
                       } else {
                           self.themes.hideActivityIndicator(uiView: self.view)
                           themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                       }
                       
                   }
    
}





//
//  DepositsViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 19/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class DepositsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate, UIGestureRecognizerDelegate {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    var cashDepositsArr = [AnyObject]()
    var totalBalance = Double()
    var amountArr = [String]()
    var counterBills = [AnyObject]()

    @IBOutlet var addDepositeBtn: CustomButton!
    @IBOutlet var balanceLabel: UILabel!
    
    @IBOutlet var backView1: UIView!
    @IBOutlet var backView2: UIView!
    
    @IBOutlet var addDepositeTableView: UITableView!
        
    @IBOutlet var hideView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var addDepositTF: UITextField!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var countBillsBtn: UIButton!
    @IBOutlet var popDepositeBtn: UIButton!
        
    @IBOutlet var detailsPopView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var commentsTextView: UITextView!
    @IBOutlet var detailsCancelBtn: UIButton!
    @IBOutlet var undoEntryBtn: UIButton!
    @IBOutlet var commentTextView: UITextView!
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView1.layer.cornerRadius = 8
        backView2.layer.cornerRadius = 8
        addDepositeTableView.layer.cornerRadius = 8
        addDepositeBtn.layer.cornerRadius = 5
        popUpView.layer.cornerRadius = 8
        cancelBtn.layer.cornerRadius = 5
        countBillsBtn.layer.cornerRadius = 5
        popDepositeBtn.layer.cornerRadius = 5
        cancelBtn.layer.masksToBounds = true
        countBillsBtn.layer.masksToBounds = true
        popDepositeBtn.layer.masksToBounds = true
        addDepositTF.delegate = self
        
        hideView.isHidden = true
        popUpView.isHidden = true
        cancelBtn.isHidden = true
        countBillsBtn.isHidden = true
        popDepositeBtn.isHidden = true
        
        detailsPopView.isHidden = true
        detailsCancelBtn.isHidden = true
        undoEntryBtn.isHidden = true
        detailsPopView.layer.cornerRadius = 8
        detailsCancelBtn.layer.cornerRadius = 5
        detailsCancelBtn.layer.masksToBounds = true
        undoEntryBtn.layer.cornerRadius = 5
        undoEntryBtn.layer.masksToBounds = true
        commentsTextView.delegate = self
        commentTextView.layer.cornerRadius = 5
        commentTextView.layer.borderWidth = 0.5
        commentTextView.layer.borderColor = UIColor.lightGray.cgColor
        addDepositTF.layer.cornerRadius = 5
        addDepositTF.layer.borderWidth = 0.5
        addDepositTF.layer.borderColor = UIColor.lightGray.cgColor
        
//        addDepositeTableView.delegate = self
//        addDepositeTableView.dataSource = self
        cancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        countBillsBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        popDepositeBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        detailsCancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        undoEntryBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
                
        addDepositeTableView.register(UINib(nibName: "DepositeHeaderTableCell", bundle: nil), forCellReuseIdentifier: "DepositeHeaderTableCell")
        addDepositeTableView.register(UINib(nibName: "DepositsTableViewCell", bundle: nil), forCellReuseIdentifier: "DepositsTableViewCell")
        let id = self.themes.getUserId()!
        getAllDepositsAPI(restaurantId: restId, empId: id, cashDrawrId: "5f58c174e1c79785c422f713")
        
//            let tap = UITapGestureRecognizer(target: self, action: "viewTapped:")
//             tap.delegate = self
//             self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    // UIGestureRecognizerDelegate method
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
//        if touch.view?.isDescendant(of: self.addDepositeTableView) == true {
//            return false
//        }
//        return true
//    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func detailsCancelAction(_ sender: Any) {
        hideView.isHidden = true
        detailsPopView.isHidden = true
        detailsCancelBtn.isHidden = true
        undoEntryBtn.isHidden = true
    }
    
    @IBAction func undoEntryAction(_ sender: Any) {
        hideView.isHidden = true
        detailsPopView.isHidden = true
        detailsCancelBtn.isHidden = true
        undoEntryBtn.isHidden = true
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        cancelBtn.isHidden = true
        countBillsBtn.isHidden = true
        popDepositeBtn.isHidden = true
    }
    
    @IBAction func countBillsAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        cancelBtn.isHidden = true
        countBillsBtn.isHidden = true
        popDepositeBtn.isHidden = true
        let countBillsVc = self.storyboard?.instantiateViewController(withIdentifier: "CountBillsViewController") as! CountBillsViewController
        self.navigationController?.pushViewController(countBillsVc, animated: true)
    }
    
    @IBAction func popDepositAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
        cancelBtn.isHidden = true
        countBillsBtn.isHidden = true
        popDepositeBtn.isHidden = true
        
        let amount1 = Float(addDepositTF.text!)!
        add_cash_depositsAPI(actionType: "add_deposit", action: "Add Deposit", amount: amount1, comment: commentTextView.text!, transactionType: "credit", createdBy: createId, status: "1", restaurantId: restId, cashDrawrId: "5f58c174e1c79785c422f713", counterBillList:counterBills as AnyObject)
    }
        
    @IBAction func addDepositeAction(_ sender: Any) {
        hideView.isHidden = false
        popUpView.isHidden = false
        cancelBtn.isHidden = false
        countBillsBtn.isHidden = false
        popDepositeBtn.isHidden = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "DepositeHeaderTableCell") as! DepositeHeaderTableCell
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cashDepositsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositsTableViewCell") as! DepositsTableViewCell
        cell.selectionStyle = .none
        
        let data = cashDepositsArr.reversed()[indexPath.row] as! [String:AnyObject]
        cell.actionLabel.text = self.themes.checkNullValue(data["action"] as AnyObject) as! String
        cell.amountLabel.text = self.themes.checkNullValue(data["amount"] as AnyObject) as! String
        cell.userNameLabel.text = self.themes.checkNullValue(data["employeeName"] as AnyObject) as! String
        let givenDate = self.themes.checkNullValue(data["createdOn"] as AnyObject) as! String
        let dateString: String = givenDate
        let dateFormatter1: DateFormatter = DateFormatter()
        dateFormatter1.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let yourDate: NSDate = dateFormatter1.date(from: dateString)! as NSDate
        dateFormatter1.dateFormat = "MM-dd-yyyy"
        cell.dateLabel.text = dateFormatter1.string(from: yourDate as Date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hideView.isHidden = false
        detailsPopView.isHidden = false
        detailsCancelBtn.isHidden = false
        undoEntryBtn.isHidden = false
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
        
    }
    
    @IBAction func optionsAction(_ sender: Any) {
        
    }
    
    func getAllDepositsAPI( restaurantId:String,empId:String,cashDrawrId:String) {
                   let networkRechability = urlService.connectedToNetwork()
                   if(networkRechability){
                       themes.showActivityIndicator(uiView: self.view)
                       var parameters = [String:AnyObject]()
                parameters =  ["employeeId":empId,"restaurantId":restaurantId,"cashDrawersId":cashDrawrId as AnyObject] as [String : AnyObject]
                       print("parameters is \(parameters)")
                       urlService.serviceCallPostMethodWithParams(url: get_all_cash_deposits, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                           print(response)
                       self.themes.hideActivityIndicator(uiView: self.view)
                       let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                      if(success == "1") {
                       self.cashDepositsArr = response["cashDepositsList"] as! [AnyObject]
                        
                        for i in 0..<self.cashDepositsArr.count {
                            let data = self.cashDepositsArr[i] as! [String:AnyObject]
                            let balance = self.themes.checkNullValue(data["amount"] as AnyObject) as! String
                            self.amountArr.append(balance)
                        }
                                                
                        let doubles = self.amountArr.compactMap(Double.init)
                        self.totalBalance = doubles.reduce(0, +)                        
                        self.balanceLabel.text = "$\(self.totalBalance)"
                                       
                       self.addDepositeTableView.delegate = self
                       self.addDepositeTableView.dataSource = self
                       self.addDepositeTableView.reloadData()
                      } else {

                       }
                     }
               } else {
                       self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                      }
           }
    
    func add_cash_depositsAPI(actionType:String,action:String,amount:Float,comment:String,transactionType:String,createdBy:String,status:String, restaurantId:String,cashDrawrId:String,counterBillList:AnyObject) {
                   let networkRechability = urlService.connectedToNetwork()
                   if(networkRechability){
                       themes.showActivityIndicator(uiView: self.view)
                       var parameters = [String:AnyObject]()
                    parameters =  ["actionType":actionType,"action":action ,"amount":amount ,"comment":comment,"transactionType":transactionType, "restaurantId":restaurantId,"cashDrawersId":cashDrawrId,"createdBy":createdBy,"status":status,"countBillsList":counterBillList as Any] as [String : AnyObject]
                       print("parameters is \(parameters)")
                       urlService.serviceCallPostMethodWithParams(url: add_cash_deposits, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                           print(response)
                       self.themes.hideActivityIndicator(uiView: self.view)
                       let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                        let id = self.themes.getUserId()!
                        self.getAllDepositsAPI(restaurantId: restId, empId: id, cashDrawrId: "5f58c174e1c79785c422f713")
                      if(success == "1") {
                        let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
                        self.themes.showAlert(title: "Success", message:mesg, sender: self)
                      } else {

                       }
                     }
               } else {
                       self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                      }
           }
        
    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
        
}


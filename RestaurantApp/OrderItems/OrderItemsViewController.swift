//
//  OrderItemsViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 17/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class OrderItemsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var themes = Themes()
    var urlService = URLservices.sharedInstance
    var numberOnScreen1 : Double = 0
    var performingMath1 = false
    var numberOnScreen2 : Double = 0
    var performingMath2 = false
    var numberOnScreen3 : Double = 0
    var performingMath3 = false
        
    var finalAmount = Int()
    var orderID = ""
    var checksDetailsArr = [AnyObject]()
    var firstCheck = [String:AnyObject]()
    var itemDetailsArr = [AnyObject]()
    var specialReqArr = [AnyObject]()
    var modiftListArr = [AnyObject]()
    var orderDetailsDict2 = [AnyObject]()
    var orderItemsArr2 = [AnyObject]()
        
    @IBOutlet var hideView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var custmerCreditsBtn: UIButton!
    
    @IBOutlet var tableNumbrLbl: UILabel!
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView1: UIView!
    @IBOutlet var dineInLbl: UILabel!
    @IBOutlet var checkItemsTableView: UITableView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var returnBtn: UIButton!
    @IBOutlet var recieptBtn: UIButton!
    @IBOutlet var adjustBtn: UIButton!
    @IBOutlet var closeBtn: UIButton!
    @IBOutlet var doneBtn: UIButton!
    @IBOutlet var creditsLbl: UILabel!
    @IBOutlet var discountsLbl: UILabel!
    @IBOutlet var tipsLbl: UILabel!
    @IBOutlet var subTotalLbl: UILabel!
    @IBOutlet var taxLbl: UILabel!
    @IBOutlet var dueLbl: UILabel!
    @IBOutlet var totalLbl: UILabel!
    
    @IBOutlet var backView2: UIView!
    @IBOutlet var balanceDueLbl: UILabel!
    @IBOutlet var balanceTendersLbl: UILabel!
    @IBOutlet var tipsLabel: UILabel!
    @IBOutlet var cashBtn: UIButton!
    @IBOutlet var creditBtn: UIButton!
    @IBOutlet var giftCardBtn: UIButton!
    @IBOutlet var otherBtn: UIButton!
    @IBOutlet var splitBtn: UIButton!
    
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
    @IBOutlet var button00: UIButton!
    @IBOutlet var removeBtn: UIButton!
    @IBOutlet var clearBtn: UIButton!
    @IBOutlet var dollr6Btn: UIButton!
    @IBOutlet var dollor8Btn: UIButton!
    @IBOutlet var dollor10Btn: UIButton!
    
    @IBOutlet var creditCradPopUpView: UIView!
    @IBOutlet var creditCradCancelBtn: UIButton!
    @IBOutlet var keyInCardBtn: UIButton!
    
    @IBOutlet var cashPopUpView: UIView!
    @IBOutlet var amountTenderdLbl: UILabel!
    @IBOutlet var changeDueLbl: UILabel!
    @IBOutlet var noReceiptBtn: UIButton!
    @IBOutlet var popRecieptBtn: UIButton!
    @IBOutlet var voidBtn: UIButton!
    
    @IBOutlet var giftCardPopUpView: UIView!
    @IBOutlet var cardNumberLbl: UILabel!
    @IBOutlet var popButton1: UIButton!
    @IBOutlet var popButton2: UIButton!
    @IBOutlet var popButton3: UIButton!
    @IBOutlet var popButton4: UIButton!
    @IBOutlet var popButton5: UIButton!
    @IBOutlet var popButton6: UIButton!
    @IBOutlet var popButton7: UIButton!
    @IBOutlet var popButton8: UIButton!
    @IBOutlet var popButton9: UIButton!
    @IBOutlet var popButton10: UIButton!
    @IBOutlet var popClearBtn: UIButton!
    @IBOutlet var popLookUpBtn: UIButton!
    @IBOutlet var popScanBtn: UIButton!
    @IBOutlet var popDoneBtn: UIButton!
    
    @IBOutlet var customerCreditsPopUp: UIView!
    @IBOutlet var oredrAmountLbl: UILabel!
    @IBOutlet var mobileNumberLbl: UILabel!
    @IBOutlet var numberSubmitBtn: UIButton!
    @IBOutlet var customerCreditPopHeight: NSLayoutConstraint!
    @IBOutlet var customerDetailView: UIView!
    @IBOutlet var customerNameLbl: UILabel!
    @IBOutlet var creditsView: UIView!
    @IBOutlet var customerCreditsLbl: UILabel!
    @IBOutlet var makePaymentBtn: UIButton!
    @IBOutlet var remainingCreditsLbl: UILabel!
    
    @IBOutlet var numberButton1: UIButton!
    @IBOutlet var numberButton2: UIButton!
    @IBOutlet var numberButton3: UIButton!
    @IBOutlet var numberButton4: UIButton!
    @IBOutlet var numberButton5: UIButton!
    @IBOutlet var numberButton6: UIButton!
    @IBOutlet var numberButton7: UIButton!
    @IBOutlet var numberButton8: UIButton!
    @IBOutlet var numberButton9: UIButton!
    @IBOutlet var numberButton0: UIButton!
    @IBOutlet var numberRemoveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideView.isHidden = true
        popUpView.isHidden = true
        popUpView.layer.cornerRadius = 8
        vcBackView.layer.cornerRadius = 8
        vcBackView.layer.masksToBounds = true
        backView1.layer.cornerRadius = 8
        returnBtn.layer.cornerRadius = 5
        returnBtn.layer.masksToBounds = true
        recieptBtn.layer.cornerRadius = 5
        recieptBtn.layer.masksToBounds = true
        adjustBtn.layer.cornerRadius = 5
        adjustBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = 5
        closeBtn.layer.masksToBounds = true
        doneBtn.layer.cornerRadius = 5
        doneBtn.layer.masksToBounds = true
        balanceDueLbl.layer.cornerRadius = 5
        balanceTendersLbl.layer.cornerRadius = 5
        tipsLabel.layer.cornerRadius = 5
        cashBtn.layer.cornerRadius = 5
        cashBtn.layer.masksToBounds = true
        creditBtn.layer.cornerRadius = 5
        creditBtn.layer.masksToBounds = true
        giftCardBtn.layer.cornerRadius = 5
        giftCardBtn.layer.masksToBounds = true
        otherBtn.layer.cornerRadius = 5
        otherBtn.layer.masksToBounds = true
        splitBtn.layer.cornerRadius = 5
        splitBtn.layer.masksToBounds = true
        button0.layer.cornerRadius = 5
        button0.layer.masksToBounds = true
        button1.layer.cornerRadius = 5
        button1.layer.masksToBounds = true
        button2.layer.cornerRadius = 5
        button2.layer.masksToBounds = true
        button3.layer.cornerRadius = 5
        button3.layer.masksToBounds = true
        button4.layer.cornerRadius = 5
        button4.layer.masksToBounds = true
        button5.layer.cornerRadius = 5
        button5.layer.masksToBounds = true
        button6.layer.cornerRadius = 5
        button6.layer.masksToBounds = true
        button7.layer.cornerRadius = 5
        button7.layer.masksToBounds = true
        button8.layer.cornerRadius = 5
        button8.layer.masksToBounds = true
        button9.layer.cornerRadius = 5
        button9.layer.masksToBounds = true
        button00.layer.cornerRadius = 5
        button00.layer.masksToBounds = true
        clearBtn.layer.cornerRadius = 5
        clearBtn.layer.masksToBounds = true
        removeBtn.layer.cornerRadius = 5
        removeBtn.layer.masksToBounds = true
        dollr6Btn.layer.cornerRadius = 5
        dollr6Btn.layer.masksToBounds = true
        dollor8Btn.layer.cornerRadius = 5
        dollor8Btn.layer.masksToBounds = true
        dollor10Btn.layer.cornerRadius = 5
        dollor10Btn.layer.masksToBounds = true
                
        creditCradPopUpView.isHidden = true
        creditCradCancelBtn.isHidden = true
        keyInCardBtn.isHidden = true
        cashPopUpView.isHidden = true
        voidBtn.isHidden = true
        noReceiptBtn.isHidden = true
        popRecieptBtn.isHidden = true
        creditCradPopUpView.layer.cornerRadius = 8
        creditCradPopUpView.layer.masksToBounds = true
        cashPopUpView.layer.cornerRadius = 8
        cashPopUpView.layer.masksToBounds = true
        creditCradCancelBtn.layer.cornerRadius = 5
        creditCradCancelBtn.layer.masksToBounds = true
        creditCradCancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        keyInCardBtn.layer.cornerRadius = 5
        keyInCardBtn.layer.masksToBounds = true
        keyInCardBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        voidBtn.layer.cornerRadius = 5
        voidBtn.layer.masksToBounds = true
        voidBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        popRecieptBtn.layer.cornerRadius = 5
        popRecieptBtn.layer.masksToBounds = true
        popRecieptBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        noReceiptBtn.layer.cornerRadius = 5
        noReceiptBtn.layer.masksToBounds = true
        noReceiptBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        
        giftCardPopUpView.isHidden = true
        giftCardPopUpView.layer.cornerRadius = 8
        popButton1.layer.cornerRadius = 5
        popButton1.layer.masksToBounds = true
        popButton2.layer.cornerRadius = 5
        popButton2.layer.masksToBounds = true
        popButton3.layer.cornerRadius = 5
        popButton3.layer.masksToBounds = true
        popButton4.layer.cornerRadius = 5
        popButton4.layer.masksToBounds = true
        popButton5.layer.cornerRadius = 5
        popButton5.layer.masksToBounds = true
        popButton6.layer.cornerRadius = 5
        popButton6.layer.masksToBounds = true
        popButton7.layer.cornerRadius = 5
        popButton7.layer.masksToBounds = true
        popButton8.layer.cornerRadius = 5
        popButton8.layer.masksToBounds = true
        popButton9.layer.cornerRadius = 5
        popButton9.layer.masksToBounds = true
        popButton10.layer.cornerRadius = 5
        popButton10.layer.masksToBounds = true
        popClearBtn.layer.cornerRadius = 5
        popClearBtn.layer.masksToBounds = true
        popDoneBtn.layer.cornerRadius = 5
        popDoneBtn.layer.masksToBounds = true
        
        customerCreditsPopUp.isHidden = true
        customerCreditsPopUp.layer.cornerRadius = 8
        customerCreditsPopUp.layer.masksToBounds = true
        numberSubmitBtn.layer.cornerRadius = 5
        numberSubmitBtn.layer.masksToBounds = true
        numberSubmitBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        customerCreditPopHeight.constant = 190
        numberButton0.layer.borderWidth = 1
        numberButton0.layer.borderColor = UIColor(red: 181/255, green: 200/255, blue: 203/255, alpha: 1.0).cgColor
        customerCreditsPopUp.isHidden = true
        makePaymentBtn.layer.cornerRadius = 5
        makePaymentBtn.layer.masksToBounds = true
        makePaymentBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        customerNameLbl.layer.borderWidth = 1
        customerNameLbl.layer.borderColor = UIColor(red: 181/255, green: 200/255, blue: 203/255, alpha: 1.0).cgColor
        creditsView.layer.borderWidth = 1
        creditsView.layer.borderColor = UIColor(red: 181/255, green: 200/255, blue: 203/255, alpha: 1.0).cgColor
        
        shadowToView(view: balanceDueLbl)
        shadowToView(view: balanceTendersLbl)
        shadowToView(view: tipsLabel)
        
        self.checkItemsTableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        self.checkItemsTableView.register(UINib(nibName: "SubItemTableViewCell", bundle: nil), forCellReuseIdentifier: "SubItemTableViewCell")
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.hideView.addSubview(button)
        balanceTendersLbl.text = ""
//        get_table_orderAPI(restaurantId: restId, tableNo: tableNumber)
        view_order_for_paymentAPI(orderId: orderID, restarentId: restId)
        
        // Do any additional setup after loading the view.
    }
    
     @objc func buttonAction(sender: UIButton!) {
        hideView.isHidden = true
        popUpView.isHidden = true
        giftCardPopUpView.isHidden = true
        creditCradPopUpView.isHidden = true
        creditCradCancelBtn.isHidden = true
        keyInCardBtn.isHidden = true
        cashPopUpView.isHidden = true
        voidBtn.isHidden = true
        noReceiptBtn.isHidden = true
        popRecieptBtn.isHidden = true
        customerCreditsPopUp.isHidden = true
        customerDetailView.isHidden = true
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
    
    @IBAction func homeBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func viewItemsAction(_ sender: Any) {
        let viewItemVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewItemsVC") as! ViewItemsVC
        self.navigationController?.pushViewController(viewItemVc, animated: true)
    }
    
    @IBAction func svcChargeAction(_ sender: Any) {
        
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
        
    }
    
    @IBAction func optionsAction(_ sender: Any) {
        
    }
    
    @IBAction func cashBtnAction(_ sender: Any) {
        hideView.isHidden = false
        cashPopUpView.isHidden = false
        voidBtn.isHidden = false
        noReceiptBtn.isHidden = false
        popRecieptBtn.isHidden = false
        amountTenderdLbl.text = "$ \(balanceTendersLbl.text!)"
    }
    
    @IBAction func noRecieptAction(_ sender: Any) {
        hideView.isHidden = true
        cashPopUpView.isHidden = true
        voidBtn.isHidden = true
        noReceiptBtn.isHidden = true
        popRecieptBtn.isHidden = true
    }
    
    @IBAction func popRecieptAction(_ sender: Any) {
        hideView.isHidden = true
        cashPopUpView.isHidden = true
        voidBtn.isHidden = true
        noReceiptBtn.isHidden = true
        popRecieptBtn.isHidden = true
    }
    
    @IBAction func voidBtnAction(_ sender: Any) {
        hideView.isHidden = true
        cashPopUpView.isHidden = true
        voidBtn.isHidden = true
        noReceiptBtn.isHidden = true
        popRecieptBtn.isHidden = true
//        self.finalAmount = Int(amountTenderdLbl.text!)!
        self.finalAmount = Int(Double(balanceTendersLbl.text!)!)
        let  id = self.themes.getUserId()!
        pay_orderAPI(posOrderId: orderID, cashDrawerId: "5f58c174e1c79785c422f713", amount: finalAmount, paymentType: 0, createdBy: id, restarentId: restId)
    }
    
    @IBAction func creditBtnAction(_ sender: Any) {
        hideView.isHidden = false
        creditCradPopUpView.isHidden = false
        creditCradCancelBtn.isHidden = false
        keyInCardBtn.isHidden = false
    }
    
    @IBAction func creitPopCancelAction(_ sender: Any) {
        hideView.isHidden = true
        creditCradPopUpView.isHidden = true
        creditCradCancelBtn.isHidden = true
        keyInCardBtn.isHidden = true
    }
    
    @IBAction func keyInCardAction(_ sender: Any) {
        hideView.isHidden = true
        creditCradPopUpView.isHidden = true
        creditCradCancelBtn.isHidden = true
        keyInCardBtn.isHidden = true
    }
    
    @IBAction func giftCardBtnAction(_ sender: Any) {
        hideView.isHidden = false
        giftCardPopUpView.isHidden = false
    }
    
    @IBAction func giftCardCanceAction(_ sender: Any) {
        hideView.isHidden = true
        giftCardPopUpView.isHidden = true
    }
    
    @IBAction func popNumbersAction(_ sender: UIButton) {
                if performingMath2 == true {
                cardNumberLbl.text = String(sender.tag-1)
                numberOnScreen2 = Double(cardNumberLbl.text!)!
                performingMath2 = false
                } else {
                    if sender.tag == 0 {
                     cardNumberLbl.text = cardNumberLbl.text! + "00"
                    } else {
                    cardNumberLbl.text = cardNumberLbl.text! + String(sender.tag-1)
                    }
                }
       }
            
    @IBAction func popOtherBtnAction(_ sender: UIButton) {
        if sender.tag == 101 {
            var runningNumber = cardNumberLbl.text!
            if runningNumber == "0"{
                cardNumberLbl.text = "0"
            } else {
            runningNumber = String(runningNumber.dropLast())
            cardNumberLbl.text = "\(runningNumber)"
            }
         }
       }
    
    @IBAction func splitBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func otherAction(_ sender: Any) {
        hideView.isHidden = false
        popUpView.isHidden = false
    }
    
    @IBAction func customerCreditsAction(_ sender: Any) {
        popUpView.isHidden = true
        customerCreditsPopUp.isHidden = false
        customerCreditPopHeight.constant = 190
        customerDetailView.isHidden = true
    }
    
    @IBAction func numberEnterAction(_ sender: Any) {
        customerCreditPopHeight.constant = 590
        customerDetailView.isHidden = true
    }
    
    @IBAction func numberSubmitAction(_ sender: Any) {
        if mobileNumberLbl.text == "" {
            self.themes.showAlert(title: "Alert", message: "Please enter Mobile Number", sender: self)
        } else {
            view_customer_phoneAPI(restaurantId: restId, phonenumber: mobileNumberLbl.text!)
            
        }
    }
    
    @IBAction func makePaymentAction(_ sender: Any) {
        
    }
    
    @IBAction func phoneNumbersAction(_ sender: UIButton) {
             if performingMath3 == true {
             mobileNumberLbl.text = String(sender.tag-1)
             numberOnScreen3 = Double(mobileNumberLbl.text!)!
             performingMath3 = false
             } else {
                 if sender.tag == 100 {
                  var runningNumber = mobileNumberLbl.text!
                  if runningNumber == "0"{
                      mobileNumberLbl.text = ""
                  } else {
                  runningNumber = String(runningNumber.dropLast())
                  mobileNumberLbl.text = "\(runningNumber)"
                  }
                    
               } else {
                mobileNumberLbl.text = mobileNumberLbl.text! + String(sender.tag-1)
            }
        }
    }
            
    @IBAction func numbersAction(_ sender: UIButton) {
                if performingMath1 == true {
                balanceTendersLbl.text = String(sender.tag-1)
                numberOnScreen1 = Double(balanceTendersLbl.text!)!
                performingMath1 = false
                } else {
                    if sender.tag == 0 {
                     balanceTendersLbl.text = balanceTendersLbl.text! + "00"
                    } else {                      
                    balanceTendersLbl.text = balanceTendersLbl.text! + String(sender.tag-1)
                    }
                }
       }
    
    @IBAction func otherBtnAction(_ sender: UIButton) {
        if sender.tag == 101 {
            var runningNumber = balanceTendersLbl.text!
            if runningNumber == "0"{
                balanceTendersLbl.text = ""
            } else {
            runningNumber = String(runningNumber.dropLast())
            balanceTendersLbl.text = "\(runningNumber)"
            }
        } else if sender.tag == 102{
            balanceTendersLbl.text = "0"
        } else if sender.tag == 103{
            balanceTendersLbl.text = "6.00"
        } else if sender.tag == 104{
            balanceTendersLbl.text = "8.00"
        } else if sender.tag == 105{
            balanceTendersLbl.text = "10.00"
        }
        
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderItemsArr2.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 0
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell") as! ItemsTableViewCell
        
            let data = orderItemsArr2[section] as! [String:AnyObject]
                header.itemNameLbl.text = self.themes.checkNullValue(data["itemName"] as AnyObject) as! String
                header.amountLbl.text = self.themes.checkNullValue(data["quantity"] as AnyObject) as! String
                header.tipLabel.text = self.themes.checkNullValue(data[""] as AnyObject) as! String
                header.totalAmountLbl.text = self.themes.checkNullValue(data["totalPrice"] as AnyObject) as! String
                self.specialReqArr = data["specialRequestList"] as! [AnyObject]
                self.modiftListArr = data["modifiersList"] as! [AnyObject]
        
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubItemTableViewCell", for: indexPath) as! SubItemTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func pay_orderAPI(posOrderId:String, cashDrawerId:String, amount:Int, paymentType:Int, createdBy:String, restarentId:String) {
                let networkRechability = urlService.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
    //                let id = self.themes.getUserId()!
                    var parameters = [String:AnyObject]()
                    parameters =  ["posOrderId":posOrderId,"cashDrawerId":cashDrawerId,"paymentType":paymentType,"amount":amount,"createdBy":createdBy,"restaurantId":restarentId as AnyObject] as [String : AnyObject]
                    print("parameters is \(parameters)")
                    urlService.serviceCallPostMethodWithParams(url: pay_order, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                        print(response)
                    self.themes.hideActivityIndicator(uiView: self.view)
             let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                   if(success == "1") {
                
                let due = self.themes.checkNullValue(response["due"] as AnyObject) as! String
                    self.balanceDueLbl.text = "$ \(due)"
            let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
               self.themes.showAlert(title: "Success", message: mesg, sender: self)
                   } else {
            let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
               self.themes.showAlert(title: "Oops ☹️", message: mesg, sender: self)
                    }
                  }
            } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                   }
        }
    
    func view_order_for_paymentAPI(orderId:String,restarentId:String) {
                let networkRechability = urlService.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
                    let id = self.themes.getUserId()!
                    var parameters = [String:AnyObject]()
                    parameters =  ["orderId":orderId,"userId":id,"restaurantId":restarentId as AnyObject] as [String : AnyObject]
                    print("parameters is \(parameters)")
                    urlService.serviceCallPostMethodWithParams(url: view_order_for_payment, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                        print(response)
                    self.themes.hideActivityIndicator(uiView: self.view)
             let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                   if(success == "1") {
           self.orderDetailsDict2 = response["orderDetails"] as! [AnyObject]
                let detailsArr = self.orderDetailsDict2[0]
            self.orderItemsArr2 = detailsArr["orderItems"] as! [AnyObject]
            let checkNum = self.themes.checkNullValue(detailsArr["checkNumber"] as AnyObject) as! String
            let dineIn = self.themes.checkNullValue(detailsArr["dineInBehaviour"] as AnyObject) as! String
            self.dineInLbl.text = "#\(checkNum) \(dineIn)"
            self.nameLbl.text = self.themes.checkNullValue(detailsArr["createdByName"] as AnyObject) as! String
            self.creditsLbl.text = "$ \(self.themes.checkNullValue(detailsArr["creditsUsed"] as AnyObject) as! String)"
            self.discountsLbl.text = "$ \(self.themes.checkNullValue(detailsArr["discountAmount"] as AnyObject) as! String)"
            self.tipsLbl.text = "$ \(self.themes.checkNullValue(detailsArr["tipAmount"] as AnyObject) as! String)"
            self.subTotalLbl.text = "$ \(self.themes.checkNullValue(detailsArr["subTotal"] as AnyObject) as! String)"
            self.taxLbl.text = "$ \(self.themes.checkNullValue(detailsArr["taxAmount"] as AnyObject) as! String)"
            self.dueLbl.text = self.themes.checkNullValue(detailsArr[""] as AnyObject) as! String
            self.totalLbl.text = "$ \(self.themes.checkNullValue(detailsArr["totalAmount"] as AnyObject) as! String)"

                    var totalPrice = [String]()
                    var sumOfPrices = Double()
                    for i in 0..<self.orderItemsArr2.count {
                       let sample = self.orderItemsArr2[i]
                        print(sample)
                       let qty = self.themes.checkNullValue(sample["quantity"] as AnyObject) as! String
                       let itemPrice = self.themes.checkNullValue(sample["totalPrice"] as AnyObject) as! String
                       let price = Int(qty)! * Int(itemPrice)!
                        let price1 = String(price)
                        totalPrice.append(price1)
                     }
                    if totalPrice.count > 0 {
                        sumOfPrices = totalPrice.reduce(0.0, {$0 + (Double($1) ?? 0.0)})
                        self.subTotalLbl.text = "$ \(sumOfPrices)"
                    } else {
                        self.subTotalLbl.text = "$ 0.00"
                    }
                    let balance = "0"
                    let total = sumOfPrices - Double(balance)!
                    self.totalLbl.text = "$ \(total)"
            
            self.checkItemsTableView.delegate = self
            self.checkItemsTableView.dataSource = self
            self.checkItemsTableView.reloadData()
                   } else {
            let mesg = self.themes.checkNullValue(response["result"] as AnyObject) as! String
               self.themes.showAlert(title: "Oops ☹️", message: mesg, sender: self)
                    }
                  }
            } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                   }
        }
    
//    func get_table_orderAPI(restaurantId:String,tableNo:String) {
//                let networkRechability = urlService.connectedToNetwork()
//                if(networkRechability){
//                    themes.showActivityIndicator(uiView: self.view)
//                    let id = self.themes.getUserId()!
//                    var parameters = [String:AnyObject]()
//                    parameters =  ["restaurantId":restaurantId,"userId":id,"tableNumber":tableNo as AnyObject] as [String : AnyObject]
//                    print("parameters is \(parameters)")
//                    urlService.serviceCallPostMethodWithParams(url: get_table_order, params: parameters as Dictionary<String, AnyObject>) { response,error  in
//                        print(response)
//                    self.themes.hideActivityIndicator(uiView: self.view)
//                    let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
//                   if(success == "1") {
//
//                    self.checksDetailsArr = response["checksDetails"] as! [AnyObject]
//                    self.firstCheck = self.checksDetailsArr[0] as! [String : AnyObject]
//            self.nameLbl.text = self.themes.checkNullValue(self.firstCheck["createdByName"] as AnyObject) as! String
//                    self.itemDetailsArr = self.firstCheck["itemsDetails"] as! [AnyObject]
//                    print(self.itemDetailsArr)
//
//                    var totalPrice = [String]()
//                    var sumOfPrices = Double()
//                    for i in 0..<self.itemDetailsArr.count {
//                       let sample = self.itemDetailsArr[i]
//                       let qty = self.themes.checkNullValue(sample["quantity"] as AnyObject) as! String
//                       let itemPrice = self.themes.checkNullValue(sample["totalPrice"] as AnyObject) as! String
//                       let price = Int(qty)! * Int(itemPrice)!
//                        let price1 = String(price)
//                        totalPrice.append(price1)
//                     }
//                    if totalPrice.count > 0 {
//                        sumOfPrices = totalPrice.reduce(0.0, {$0 + (Double($1) ?? 0.0)})
//                        self.subTotalLbl.text = "$ \(sumOfPrices)"
//                    } else {
//                        self.subTotalLbl.text = "$ 0.00"
//                    }
//                    let balance = "0"
//                    let total = sumOfPrices - Double(balance)!
//                    self.totalLbl.text = "$ \(total)"
//
//                    self.checkItemsTableView.delegate = self
//                    self.checkItemsTableView.dataSource = self
//                    self.checkItemsTableView.reloadData()
//
//                   } else {
//
//                    }
//                  }
//            } else {
//                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
//                   }
//        }
    
    func view_customer_phoneAPI( restaurantId:String, phonenumber:String) {
               let networkRechability = urlService.connectedToNetwork()
               if(networkRechability){
                   themes.showActivityIndicator(uiView: self.view)
                   var parameters = [String:AnyObject]()
                   let id = self.themes.getUserId()!
                   parameters =  ["userId":id,"restaurantId":restaurantId,"phonenumber":phonenumber as AnyObject] as [String : AnyObject]
                   print("parameters is \(parameters)")
                   urlService.serviceCallPostMethodWithParams(url: view_customer_phone, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                       print(response)
                   self.themes.hideActivityIndicator(uiView: self.view)
                   let success = self.themes.checkNullValue(response["responseStatus"] as! AnyObject) as! String
                  if(success == "1") {
                   let customerDetails = response["customer"] as! [AnyObject]
                    let data = customerDetails[0]
                    self.customerCreditsLbl.text = self.themes.checkNullValue(data["credits"] as! AnyObject) as! String
                    let fstName = self.themes.checkNullValue(data["firstName"] as! AnyObject) as! String
                    let lastName = self.themes.checkNullValue(data["lastName"] as! AnyObject) as! String
                    self.customerNameLbl.text = fstName + lastName
                    
                    self.customerDetailView.isHidden = false
                  } else {

                       }
                 }
           } else {
                   self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                  }
       }
    
}

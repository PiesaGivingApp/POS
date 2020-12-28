//
//  CashCreditPopupVC.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 22/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class CashCreditPopupVC: UIViewController {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
        
    var numberOnScreen : Double = 0
    var performingMath = false
    var fromScreen = ""
    var giftCardNum = Int()
    var amount = Int()
    var cardType = ""
    
        
    @IBOutlet var vcBackView: UIView!
        
    @IBOutlet var giftCardPopUp: UIView!
    @IBOutlet var giftCardNameLbl: UILabel!    
    @IBOutlet var numberLabel: UILabel!
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
    @IBOutlet var removeButton: UIButton!
    @IBOutlet var lookUpBtn: UIButton!
    @IBOutlet var scanBtn: UIButton!
    @IBOutlet var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if fromScreen == "quickOrder1"{
            giftCardPopUp.isHidden = false
            giftCardNameLbl.text = "Activate Gift Card ($\(amount))"
        } else if fromScreen == "quickOrder2"{
            giftCardPopUp.isHidden = false
            giftCardNameLbl.text = "Add Value ($\(amount))"
        }

        vcBackView.layer.cornerRadius = 8
        vcBackView.layer.masksToBounds = true
        giftCardPopUp.layer.cornerRadius = 8
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
        removeButton.layer.cornerRadius = 5
        removeButton.layer.masksToBounds = true
        doneBtn.layer.cornerRadius = 5
        doneBtn.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
        
    @IBAction func giftCardCloseAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func numersAction(_ sender: UIButton) {
                if performingMath == true {
                numberLabel.text = String(sender.tag-1)
                numberOnScreen = Double(numberLabel.text!)!
                performingMath = false
                } else {
                numberLabel.text = numberLabel.text! + String(sender.tag-1)
                    giftCardNum = Int(numberLabel.text!)!
        //        numberOnScreen = Double(numberLabel.text!)!
                }
    }
    
    @IBAction func otherBtnAction(_ sender: UIButton) {
        var runningNumber = numberLabel.text!
          if sender.tag == 102 {
             runningNumber = String(runningNumber.dropLast())
             numberLabel.text = "\(runningNumber)"
          } else if sender.tag == 100 {
            if fromScreen == "quickOrder1" {
            sellGiftCardAPI(giftCardNo: giftCardNum, paymnetType: 0, amount: amount, CardType: cardType, createdBy: "5ec629ad0ae0b6043743eab9", restarentId: "5ec628eb0ae0b6043743eab6")
            } else if fromScreen == "quickOrder2" {
           giftCardAddValueAPI(giftCardNo: giftCardNum, paymnetType: 0, amount: amount, createdBy: "5ec629ad0ae0b6043743eab9", restarentId: restId)
            }

        }
    }
    
    func sellGiftCardAPI(giftCardNo:Int, paymnetType:Int, amount:Int, CardType:String, createdBy:String, restarentId:String) {
                    let networkRechability = urlService.connectedToNetwork()
                    if(networkRechability){
                        themes.showActivityIndicator(uiView: self.view)
        //                let id = self.themes.getUserId()!
                        var parameters = [String:AnyObject]()
            parameters =  ["giftCardNo":giftCardNo,"paymentType":paymnetType,"amount":amount,"cardType":CardType,"createdBy":createdBy,"restaurantId":restarentId as AnyObject] as [String : AnyObject]
                        print("parameters is \(parameters)")
                        urlService.serviceCallPostMethodWithParams(url: sell_gift_card, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                            print(response)
                        self.themes.hideActivityIndicator(uiView: self.view)
                 let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                       if(success == "1") {
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
    
    func giftCardAddValueAPI(giftCardNo:Int, paymnetType:Int, amount:Int, createdBy:String, restarentId:String) {
                    let networkRechability = urlService.connectedToNetwork()
                    if(networkRechability){
                        themes.showActivityIndicator(uiView: self.view)
        //                let id = self.themes.getUserId()!
                        var parameters = [String:AnyObject]()
            parameters =  ["giftCardNo":giftCardNo,"paymentType":paymnetType,"amount":amount,"createdBy":createdBy,"restaurantId":restarentId as AnyObject] as [String : AnyObject]
                        print("parameters is \(parameters)")
                        urlService.serviceCallPostMethodWithParams(url: gift_card_add_value, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                            print(response)
                        self.themes.hideActivityIndicator(uiView: self.view)
                 let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                       if(success == "1") {
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
}
    


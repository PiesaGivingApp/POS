//
//  AddNewCustomerViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 01/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView: UIView!
    @IBOutlet var firstNameTf: UITextField!
    @IBOutlet var lastNameTf: UITextField!
    @IBOutlet var phoneTf: UITextField!
    @IBOutlet var emailTf: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vcBackView.layer.cornerRadius = 8
        backView.layer.cornerRadius = 8

        firstNameTf.layer.borderWidth = 0.7
        firstNameTf.layer.cornerRadius = 8
        firstNameTf.layer.borderColor = UIColor.init(red: 139/255, green: 168/255, blue: 172/255, alpha: 1).cgColor
       
        lastNameTf.layer.borderWidth = 0.7
        lastNameTf.layer.cornerRadius = 8
        lastNameTf.layer.borderColor = UIColor.init(red: 139/255, green: 168/255, blue: 172/255, alpha: 1).cgColor
        
        phoneTf.layer.borderWidth = 0.7
        phoneTf.layer.cornerRadius = 8
        phoneTf.layer.borderColor = UIColor.init(red: 139/255, green: 168/255, blue: 172/255, alpha: 1).cgColor
        
        emailTf.layer.borderWidth = 0.7
        emailTf.layer.cornerRadius = 8
        emailTf.layer.borderColor = UIColor.init(red: 139/255, green: 168/255, blue: 172/255, alpha: 1).cgColor
                        
        addBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        addBtn.layer.cornerRadius = 5
        addBtn.layer.masksToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
           view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        if validatedFields(){
            add_customerAPI(firstName:firstNameTf.text!, lastName:lastNameTf.text!, email:emailTf.text!, phNumber:phoneTf.text!, restarentId:restId, createBy:createId, status:1)

        } else {

        }
//        let customerRecordVc = self.storyboard?.instantiateViewController(withIdentifier: "CustomerRecordViewController") as! CustomerRecordViewController
//         self.navigationController?.pushViewController(customerRecordVc, animated: true)

    }
    func isValidEmail(_ email: String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: email)
       }
    
    func validatedFields() -> Bool{
        if(firstNameTf.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter First name.", sender: self)
                       return false
             } else if(lastNameTf.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter your Last name.", sender: self)
                return false
             } else if(emailTf.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter your email.", sender: self)
                return false
            } else if(!(isValidEmail(emailTf.text!))){
                themes.showAlert(title: "Alert", message: "Please enter valid email.", sender: self)
                return false
            } else if(phoneTf.text == ""){
                themes.showAlert(title: "Alert", message: "Please enter Phone Number.", sender: self)
                return false
            }
            return true
        }
    
    func add_customerAPI(firstName:String,lastName:String,email:String,phNumber:String,restarentId:String, createBy:String,status:Int) {
            let networkRechability = urlService.connectedToNetwork()
            if(networkRechability){
                themes.showActivityIndicator(uiView: self.view)
                
                var parameters = [String:AnyObject]()
                parameters = ["firstName":firstName,"lastName":lastName,"phoneNumber":phNumber, "email":email,"restaurantId":restarentId,"createdBy":createBy,"status":status] as [String : AnyObject]
                print("parameters is \(parameters)")
                urlService.serviceCallPostMethodWithParams(url:add_customers, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                    print(response)
                self.themes.hideActivityIndicator(uiView: self.view)
                let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                    if(success == "1") {
                let custId = self.themes.checkNullValue(response["result"] as AnyObject) as! String
            let customerRecordVc = self.storyboard?.instantiateViewController(withIdentifier: "CustomerRecordViewController") as! CustomerRecordViewController
                    customerRecordVc.custmrId = custId
            self.navigationController?.pushViewController(customerRecordVc, animated: true)
              
               } else {
                self.themes.showAlert(title: "Oops ☹️", message: self.themes.checkNullValue(response["result"] as AnyObject) as! String, sender: self)
                    }
              }
        } else {
                self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
               }
    }

}


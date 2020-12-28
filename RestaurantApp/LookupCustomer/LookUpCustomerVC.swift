//
//  LookUpCustomerVC.swift
//  RestaurantApp
//
//  Created by INDOBYTES on 31/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class LookUpCustomerVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    var numberOnScreen : Double = 0
    var performingMath = false
    var customerDetails = [AnyObject]()
    
    @IBOutlet weak var numberBottomView: UIView!
    @IBOutlet weak var addNewCustomerBtn: UIButton!
    @IBOutlet weak var addNewCustomerView: UIView!
    @IBOutlet weak var numbersBackView: UIView!
    @IBOutlet weak var nameMailButton: UIButton!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var mailBottomView: UIView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var textFieldBackView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet var hideView: UIView!
    @IBOutlet var customerPopUpView: UIView!
    @IBOutlet var customerListTableView: UITableView!
    @IBOutlet var noCoustmerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideView.isHidden = true
        customerPopUpView.isHidden = true
        customerPopUpView.layer.cornerRadius = 8
        customerPopUpView.layer.masksToBounds = true
        textFieldBackView.layer.borderWidth = 1
        numberTextField.isUserInteractionEnabled = false
        textFieldBackView.layer.borderColor
            = UIColor(red: 0/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0).cgColor

        textFieldBackView.layer.cornerRadius = 8
        addNewCustomerBtn.layer.cornerRadius = 5
         addNewCustomerBtn.applyGradient(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
        self.customerListTableView.register(UINib(nibName: "CustomerTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomerTableViewCell")
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.hideView.addSubview(button)
 
    }
    @objc func buttonAction(sender: UIButton!) {
        hideView.isHidden = true
        customerPopUpView.isHidden = true
    }
    
    @IBAction func numberAction(_ sender: Any) {
        
        numberButton.setTitleColor( UIColor(red: 0/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0), for: .normal)
        
        numberBottomView.backgroundColor = UIColor(red: 0/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0)
        
        nameMailButton.setTitleColor( UIColor(red: 1/255.0, green: 13/255.0, blue: 28/255.0, alpha: 1.0), for: .normal)
        mailBottomView.backgroundColor = UIColor.clear
       numbersBackView.isHidden = false
       addNewCustomerView.isHidden = true
       numberTextField.isUserInteractionEnabled = false
    }
    
    @IBAction func numbersAction(_ sender: UIButton) {
                if performingMath == true {
                numberTextField.text = String(sender.tag-1)
                numberOnScreen = Double(numberTextField.text!)!
                performingMath = false
                } else {
                    if sender.tag == 0 {
                     numberTextField.text = numberTextField.text! + "00"
                    } else {
                numberTextField.text = numberTextField.text! + String(sender.tag-1)
        //        numberOnScreen = Double(numberLabel.text!)!
                    }
                }
    }

    @IBAction func otherAction(_ sender: UIButton) {
        if sender.tag == 101 {
            var runningNumber = numberTextField.text!
            if runningNumber == "0"{
                numberTextField.text = "0"
            } else {
            runningNumber = String(runningNumber.dropLast())
            numberTextField.text = "\(runningNumber)"
            }
        } else {
            
        }
    }
    
    @IBAction func nameMailAction(_ sender: Any) {
        numberButton.setTitleColor(   UIColor(red: 1/255.0, green: 13/255.0, blue: 28/255.0, alpha: 1.0), for: .normal)
        numberBottomView.backgroundColor = UIColor.clear
        nameMailButton.setTitleColor( UIColor(red: 0/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0), for: .normal)
        mailBottomView.backgroundColor =   UIColor(red: 0/255.0, green: 191/255.0, blue: 223/255.0, alpha: 1.0)
        numbersBackView.isHidden = true
        numberTextField.isUserInteractionEnabled = true
        addNewCustomerView.isHidden = true
    }
    
    @IBAction func searchAction(_ sender: Any) {
//        numbersBackView.isHidden = true
//        addNewCustomerView.isHidden = false
        view_customer_phoneAPI(restaurantId: restId, phonenumber: numberTextField.text!)
    }
    
    @IBAction func textFieldSearchAction(_ sender: Any) {
       view_customer_emailAPI(restaurantId: restId, email_name: numberTextField.text!)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewCustomerAction(_ sender: Any) {
        let addCustomerVc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewCustomerViewController") as! AddNewCustomerViewController
        self.navigationController?.pushViewController(addCustomerVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell", for: indexPath) as! CustomerTableViewCell
        
        let data = customerDetails[indexPath.row] as! [String:AnyObject]
        let fstName = self.themes.checkNullValue(data["firstName"] as AnyObject) as! String
        let lastName = self.themes.checkNullValue(data["lastName"] as AnyObject) as! String
        cell.nameLbl.text = fstName + lastName
        cell.numberLbl.text = self.themes.checkNullValue(data["phoneNumber"] as AnyObject) as? String
        cell.emailLbl.text = self.themes.checkNullValue(data["email"] as AnyObject) as? String
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = customerDetails[indexPath.row] as! [String:AnyObject]
        let custd = self.themes.checkNullValue(data["id"] as AnyObject) as! String
        let restId = self.themes.checkNullValue(data["restaurantId"] as AnyObject) as! String
        let createBy = self.themes.checkNullValue(data["createdBy"] as AnyObject) as! String
        let custmerRecordVc = self.storyboard?.instantiateViewController(withIdentifier: "CustomerRecordViewController") as! CustomerRecordViewController
        custmerRecordVc.restrentId = restId
        custmerRecordVc.custmrId = custd
        custmerRecordVc.createBy = createBy
        self.navigationController?.pushViewController(custmerRecordVc, animated: true)
    }
            
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
                self.customerDetails = response["customer"] as! [AnyObject]
                self.numbersBackView.isHidden = false
                self.addNewCustomerView.isHidden = true
                self.hideView.isHidden = false
                self.customerPopUpView.isHidden = false
                self.addNewCustomerView.isHidden = true
                self.customerListTableView.delegate = self
                self.customerListTableView.dataSource = self
                self.customerListTableView.reloadData()
               } else {
                self.numbersBackView.isHidden = true
                self.addNewCustomerView.isHidden = false
                self.hideView.isHidden = true
                self.customerPopUpView.isHidden = true
                self.addNewCustomerView.isHidden = false
                    }
              }
        } else {
                self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
               }
    }
    
    func view_customer_emailAPI( restaurantId:String,email_name:String) {
            let networkRechability = urlService.connectedToNetwork()
            if(networkRechability){
                themes.showActivityIndicator(uiView: self.view)
               let id = self.themes.getUserId()!
                var parameters = [String:AnyObject]()
                parameters =  ["userId":id,"restaurantId":restaurantId,"name_or_email":email_name as AnyObject] as [String : AnyObject]
                print("parameters is \(parameters)")
                urlService.serviceCallPostMethodWithParams(url: customer_name_email, params: parameters as Dictionary<String, AnyObject>) { response,error  in
                    print(response)
                self.themes.hideActivityIndicator(uiView: self.view)
                let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
               if(success == "1") {
                self.customerDetails = response["customer"] as! [AnyObject]
                self.numbersBackView.isHidden = true
                self.addNewCustomerView.isHidden = true
                self.hideView.isHidden = false
                self.customerPopUpView.isHidden = false
                self.addNewCustomerView.isHidden = true
                self.customerListTableView.delegate = self
                self.customerListTableView.dataSource = self
                self.customerListTableView.reloadData()
               } else {
                self.numbersBackView.isHidden = true
                self.addNewCustomerView.isHidden = false
                self.hideView.isHidden = true
                self.customerPopUpView.isHidden = true
                self.addNewCustomerView.isHidden = false
                }
              }
        } else {
                self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
               }
    }

}

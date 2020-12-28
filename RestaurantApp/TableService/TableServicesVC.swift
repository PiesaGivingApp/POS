//
//  TableServicesVC.swift
//  RestaurantApp
//
//  Created by Naveen kunchal on 12/11/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit
import WebKit

class TableServicesVC: UIViewController,UITableViewDelegate,UITableViewDataSource,WKNavigationDelegate, WKScriptMessageHandler {

    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    @IBOutlet weak var dinninView: UIView!
    @IBOutlet weak var tableServiceWebView: WKWebView!
    @IBOutlet weak var dinninLbl: UILabel!
    
    @IBOutlet weak var dinninOptionTableView: UITableView!
    
    @IBOutlet weak var DinninPopView: UIView!
    var userController:WKUserContentController = WKUserContentController()

    
    
    var dinninOptionArr = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        dinninView.layer.cornerRadius = 5
        dinninView.clipsToBounds = true
        DinninPopView.isHidden = true
        
        get_all_dinning_optionsAPI(restaurantId: "")
        
        tableServiceWebView.navigationDelegate = self
        
        
        
        // Add a script message handler for receiving messages over `nativeProcess` messageHandler. The controller needs to confirm

        // with WKScriptMessageHandler protocol

        userController.add(self, name: "nativeProcess")

        // Configure the WKWebViewConfiguration instance with the WKUserContentController

     //   tableServiceWebView.userContentController = userController
        
        // Do any additional setup after loading the view.
        let urlrequ = URLRequest(url: URL(string: "http://3.14.236.148/zingangular/mobile-tables")!)
         tableServiceWebView.load(urlrequ)
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("User message got")
      print(message.name) // prints nativeProcess string
        if(message.body is String){
             print(message.body) // prints the data that is sent from javascript
        }
    }


    @IBAction func dinninOptionbtn(_ sender: UIButton) {
        self.DinninPopView.isHidden = false
        self.dinninOptionTableView.reloadData()
    }
    
    
    
    @IBAction func BackBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dinninOptionArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }

        
        let data = self.dinninOptionArr[indexPath.row] as! [String:AnyObject]
        
        cell!.textLabel?.text =  (self.themes.checkNullValue( data["optionName"] as AnyObject) as! String)
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.dinninOptionArr[indexPath.row] as! [String:AnyObject]
        self.dinninLbl.text =  (self.themes.checkNullValue( data["optionName"] as AnyObject) as! String)
        self.DinninPopView.isHidden = true
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    func get_all_dinning_optionsAPI( restaurantId:String) {
                   let networkRechability = urlService.connectedToNetwork()
                   if(networkRechability){
                       themes.showActivityIndicator(uiView: self.view)
       //             let id = self.themes.getUserId()!
                       var parameters = [String:AnyObject]()
                       parameters =  ["userId":"5ec629ad0ae0b6043743eab9",
                         "restaurantId":"5ec628eb0ae0b6043743eab6"] as [String : AnyObject]
                       print("parameters is \(parameters)")
                       urlService.serviceCallPostMethodWithParams(url:get_all_dinning_options , params: parameters as Dictionary<String, AnyObject>) { response,error  in
                           print(response)
                       self.themes.hideActivityIndicator(uiView: self.view)
                       let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                      if(success == "1") {
                        
                        self.dinninOptionArr = response["dinningOptionsList"] as! [AnyObject]
                        self.dinninOptionTableView.delegate = self
                        self.dinninOptionTableView.dataSource = self
                        self.dinninOptionTableView.reloadData()
                        
                        
                      } else {

                       }
                     }
               } else {
                       self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                      }
           }


}

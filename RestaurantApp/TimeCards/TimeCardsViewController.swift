//
//  TimeCardsViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 13/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class TimeCardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
        
    var clock_in_Arr = [AnyObject]()
    var clock_out_Arr = [AnyObject]()
    
    @IBOutlet var clockedInView: UIView!
    @IBOutlet var clockedOutView: UIView!
        
    @IBOutlet var clockedInTableView: UITableView!
    @IBOutlet var clockedOutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clockedInView.layer.cornerRadius = 8
        clockedOutView.layer.cornerRadius = 8
        clockedInTableView.delegate = self
        clockedInTableView.dataSource = self
        clockedOutTableView.delegate = self
        clockedOutTableView.dataSource = self
        
    self.clockedInTableView.register(UINib(nibName: "ColckedOutTableViewCell", bundle: nil), forCellReuseIdentifier: "ColckedOutTableViewCell")
    self.clockedOutTableView.register(UINib(nibName: "ColckedOutTableViewCell", bundle: nil), forCellReuseIdentifier: "ColckedOutTableViewCell")
 
        Clock_in_Out(restaurantId: restId)
        // Do  any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
        
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == clockedInTableView {
            return self.clock_in_Arr.count
          } else {
            return self.clock_out_Arr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if tableView == clockedInTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColckedOutTableViewCell", for: indexPath) as! ColckedOutTableViewCell
            
            let data = self.clock_in_Arr[indexPath.row] as! [String:AnyObject]
            let firstName = self.themes.checkNullValue(data["firstName"] as AnyObject) as! String
            let lastName = self.themes.checkNullValue(data["lastName"] as AnyObject) as! String
            cell.nameLabel.text = "\(firstName) \(lastName)"
            cell.in_out_Lble.text = "IN"
            
            return cell
           } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColckedOutTableViewCell", for: indexPath) as! ColckedOutTableViewCell
            
            let data = self.clock_out_Arr[indexPath.row] as! [String:AnyObject]
            let firstName = self.themes.checkNullValue(data["firstName"] as AnyObject) as! String
            let lastName = self.themes.checkNullValue(data["lastName"] as AnyObject) as! String
            cell.nameLabel.text = "\(firstName) \(lastName)"
            cell.in_out_Lble.text = "Out"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if tableView == clockedInTableView {
                return 60
          } else {
             return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == clockedInTableView {
                
          } else {
            let data = self.clock_out_Arr[indexPath.row] as! [String:AnyObject]
            let id = self.themes.checkNullValue(data["id"] as AnyObject) as! String
            let clockVc = self.storyboard?.instantiateViewController(withIdentifier: "ClockInOutViewController") as! ClockInOutViewController
            clockVc.empID = id
            clockVc.fromScreen = "clock"
            self.navigationController?.pushViewController(clockVc, animated: true)
        }
    }
        
    func Clock_in_Out( restaurantId:String) {
                let networkRechability = urlService.connectedToNetwork()
                if(networkRechability){
                    themes.showActivityIndicator(uiView: self.view)
                 let id = self.themes.getUserId()!
                    var parameters = [String:AnyObject]()
                    parameters =  ["restaurantId":restaurantId,
                    "userId":id] as [String : AnyObject]
                    print("parameters is \(parameters)")
                    urlService.serviceCallPostMethodWithParams(url:clock_in_out_employees , params: parameters as Dictionary<String, AnyObject>) { response,error  in
                        print(response)
                    self.themes.hideActivityIndicator(uiView: self.view)
                    let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                   if(success == "1") {
                    
                    self.clock_in_Arr = response["clockedIn"] as! [AnyObject]
                    self.clock_out_Arr = response["clockedOut"] as! [AnyObject]
                    self.clockedInTableView.reloadData()
                    self.clockedOutTableView.reloadData()
                   } else {

                    }
                  }
             } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                   }
        }
 
}
     

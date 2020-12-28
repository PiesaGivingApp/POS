//
//  ClockInOutViewController.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 26/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ClockInOutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    var empID = ""
    var fromScreen = ""
    
    @IBOutlet weak var ownerLbl: UILabel!
    
    @IBOutlet weak var resturentLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView1: UIView!
    @IBOutlet var backView2: UIView!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var checkInBtn: UIButton!
    @IBOutlet var doneBtn: UIButton!
    
    @IBOutlet weak var clockinoutTableView: UITableView!
    
    var employeeInOutHoursArr = [AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vcBackView.layer.cornerRadius = 8
        backView1.layer.cornerRadius = 8
        backView2.layer.cornerRadius = 8
        checkInBtn.layer.cornerRadius = 8
        checkInBtn.layer.masksToBounds = true
        doneBtn.layer.cornerRadius = 8
        doneBtn.layer.masksToBounds = true
        
        
        clockinoutTableView.register(UINib(nibName: "ClockInOutCell", bundle: nil), forCellReuseIdentifier: "ClockInOutCell")

        if fromScreen == "clock" {
            employee_time_card_reportsAPI(restaurantId: restId, empId: empID)
        } else {
            let id = self.themes.getUserId()!
           employee_time_card_reportsAPI(restaurantId: restId, empId: id)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swiftReviewAction(_ sender: Any) {
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
    
    @IBAction func checkInAction(_ sender: Any) {
    }
    
    @IBAction func doneAction(_ sender: Any) {
    }
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeInOutHoursArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockInOutCell", for: indexPath) as! ClockInOutCell
        
        let data = self.employeeInOutHoursArr[indexPath.row] as! [String:AnyObject]
        
        let givenDate = (self.themes.checkNullValue(data["date"] as AnyObject) as! String)
        let dateString: String = givenDate
        let dateFormatter1: DateFormatter = DateFormatter()
        dateFormatter1.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let yourDate: NSDate = dateFormatter1.date(from: dateString)! as NSDate
        dateFormatter1.dateFormat = "MM-dd-yyyy"
        cell.dateLbl.text = dateFormatter1.string(from: yourDate as Date)
        
        let givenDate2 = (self.themes.checkNullValue(data["inTime"] as AnyObject) as! String)
        let dateString2: String = givenDate2
        let dateFormatter2: DateFormatter = DateFormatter()
        dateFormatter2.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let yourDate2: NSDate = dateFormatter2.date(from: dateString2)! as NSDate
        dateFormatter2.dateFormat = "MM-dd-yyyy"
        cell.inLbl.text = dateFormatter2.string(from: yourDate2 as Date)
        
        cell.jobLbl.text = (self.themes.checkNullValue(data["job"] as AnyObject) as! String)
        let givenDate3 = (self.themes.checkNullValue(data["outTime"] as AnyObject) as! String)
        let dateString3: String = givenDate3
        let dateFormatter3: DateFormatter = DateFormatter()
        dateFormatter3.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let yourDate3: NSDate = dateFormatter3.date(from: dateString3)! as NSDate
        dateFormatter3.dateFormat = "MM-dd-yyyy"
        cell.outLbl.text = dateFormatter3.string(from: yourDate3 as Date)
        
        cell.hoursLbl.text = (self.themes.checkNullValue(data["totalHours"] as AnyObject) as! String)
 
      return cell
    }

    func employee_time_card_reportsAPI( restaurantId:String,empId:String) {
                  let networkRechability = urlService.connectedToNetwork()
                  if(networkRechability){
                      themes.showActivityIndicator(uiView: self.view)
                      var parameters = [String:AnyObject]()
                parameters =  ["employeeId":empId,
                      "restaurantId":restaurantId] as [String : AnyObject]
                      print("parameters is \(parameters)")
                      urlService.serviceCallPostMethodWithParams(url:employee_time_card_reports , params: parameters as Dictionary<String, AnyObject>) { response,error  in
                          print(response)
                      self.themes.hideActivityIndicator(uiView: self.view)
                      let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                     if(success == "1") {
                   
                        self.employeeInOutHoursArr = response["employeeInOutHours"] as! [AnyObject]
                        
                        self.ownerLbl.text = (self.themes.checkNullValue(response["jobTitle"] as AnyObject) as! String)
                        self.resturentLbl.text = (self.themes.checkNullValue(response["restaurantName"] as AnyObject) as! String)
                        self.nameLbl.text = (self.themes.checkNullValue(response["employeeName"] as AnyObject) as! String)
                        
                        self.clockinoutTableView.delegate = self
                        self.clockinoutTableView.dataSource = self
                        self.clockinoutTableView.reloadData()
                        
                     } else {

                      }
                    }
               } else {
                      self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                     }
          }
        
}

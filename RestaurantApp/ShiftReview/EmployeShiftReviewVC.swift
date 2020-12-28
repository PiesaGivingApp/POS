//
//  EmployeShiftReviewVC.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 11/11/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class EmployeShiftReviewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    var createID = ""
    var fromScreen = ""
    
    var currentStatusArr = [String:AnyObject]()
    var employeeDetailsArr = [String:AnyObject]()
    var salesAndTaxesArr = [String:AnyObject]()
    var tipsSummaryArr = [String:AnyObject]()
    
    @IBOutlet var backView1: UIView!
    @IBOutlet var firstTableView: UITableView!
    
    @IBOutlet var backView2: UIView!
    @IBOutlet var employeNameLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var secondTableView: UITableView!
    @IBOutlet var backActionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView1.layer.cornerRadius = 8
        backView2.layer.cornerRadius = 8
                
      firstTableView.register(UINib(nibName: "CurrentStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentStatusTableViewCell")
      secondTableView.register(UINib(nibName: "LaborTableViewCell", bundle: nil), forCellReuseIdentifier: "LaborTableViewCell")
      secondTableView.register(UINib(nibName: "TotalAndDeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalAndDeliveryTableViewCell")
        
        if fromScreen == "managerShift"{
           view_employee_shiftreview(restaurantId: restId, createBy: createID)
        } else {
            let id = self.themes.getUserId()!
           view_employee_shiftreview(restaurantId: restId, createBy: id)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func optionsBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
        
    }
    
    @IBAction func filterAction(_ sender: Any) {
        
    }
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == firstTableView {
           return 4
        } else {
           return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == firstTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentStatusTableViewCell", for: indexPath) as! CurrentStatusTableViewCell
            cell.viewButton.addTarget(self, action: #selector(viewBtnClicked(button:)), for: .touchUpInside)
            let unpaid = self.themes.checkNullValue(currentStatusArr["unpaidChecks"] as AnyObject) as! String
            let unClosed = self.themes.checkNullValue(currentStatusArr["unclosedChecks"] as AnyObject) as! String
            let closed = self.themes.checkNullValue(currentStatusArr["closedChecks"] as AnyObject) as! String
            let cashTips = self.themes.checkNullValue(currentStatusArr["cashTipsNotDeclared"] as AnyObject) as! String
            if indexPath.row == 0 {
                cell.statusNameLabel.text = "\(unpaid) Unpaid Check"
                cell.statusImage.image = UIImage(named: "unpaid_check")
            cell.statusNameLabel.textColor = UIColor(red: 255/255, green: 30/255, blue: 30/255, alpha: 1.0)
            }else if indexPath.row == 1 {
                cell.statusNameLabel.text = "\(unClosed) Unclosed Checks"
                cell.statusImage.image = UIImage(named: "status_check")
            }else if indexPath.row == 2 {
            cell.statusNameLabel.text = "\(closed) Clocked Checks"
            cell.statusImage.image = UIImage(named: "status_check")
            }else if indexPath.row == 3 {
            cell.statusNameLabel.text = "\(cashTips) Cash tips not declered"
            cell.statusImage.image = UIImage(named: "pending")
            cell.viewButton.setTitle("Declare", for: .normal)
            cell.statusNameLabel.textColor = UIColor(red: 255/255, green: 185/255, blue: 20/255, alpha: 1.0)
                }
            return cell
        } else {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaborTableViewCell", for: indexPath) as! LaborTableViewCell
            cell.headingLbl.text = "SALES AND TAXES SUMMARY"
            cell.totalNetSales.text = "Cash On Hand"
            cell.totalHours.text = "Total Gratuity"
            cell.totalLaborCost.text = "Credit/Non-Cash Tips"
            cell.costOrSales.text = "Jane owes House"
            cell.tipsPercentLbl.text = "(0%)"
            cell.totalNetSalesLbl.text = "$\(self.themes.checkNullValue(salesAndTaxesArr["cashOnHand"] as AnyObject) as! String)"
            cell.totalHoursLbl.text = "$\(self.themes.checkNullValue(salesAndTaxesArr["gratuity"] as AnyObject) as! String)"
            cell.totalLaborCostLbl.text = "$\(self.themes.checkNullValue(salesAndTaxesArr["nonCashTips"] as AnyObject) as! String)"
            cell.costPercentLbl.text = "$\(self.themes.checkNullValue(salesAndTaxesArr["janeOwesHouse"] as AnyObject) as! String)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaborTableViewCell", for: indexPath) as! LaborTableViewCell
            cell.headingLbl.text = "TIPS SUMMARY"
            cell.totalNetSales.text = "Total Gratuity"
        cell.totalNetSalesLbl.text = "$\(self.themes.checkNullValue(tipsSummaryArr["cashGratuity"] as AnyObject) as! String)"            
            return cell
        }
      }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == firstTableView {
           return 50
        } else {
            if indexPath.row == 0 {
              return 210
            } else {
              return 90
            }
        }
    }
    
    @objc func viewBtnClicked(button: UIButton){
        let terminalVc = self.storyboard?.instantiateViewController(withIdentifier: "TerminalDeliveryPendingVC") as! TerminalDeliveryPendingVC
        terminalVc.fromScreen = "terminal"
        self.navigationController?.pushViewController(terminalVc, animated: true)
    }
    
    func view_employee_shiftreview( restaurantId:String,createBy:String) {
                      let networkRechability = urlService.connectedToNetwork()
                      if(networkRechability){
                          themes.showActivityIndicator(uiView: self.view)
          //                let id = self.themes.getUserId()!
                          var parameters = [String:AnyObject]()
                          parameters =  ["restaurantId":restaurantId,"createdBy":createBy] as [String : AnyObject]
                          print("parameters is \(parameters)")
                urlService.serviceCallPostMethodWithParams(url:view_detail_employee_shift_review , params: parameters as Dictionary<String, AnyObject>) { response,error  in
                              print(response)
                          self.themes.hideActivityIndicator(uiView: self.view)
                          let success = self.themes.checkNullValue(response["responseStatus"] as AnyObject) as! String
                         if(success == "1") {
                          
                    self.currentStatusArr = response["currentStatus"] as! [String:AnyObject]
                    self.employeeDetailsArr = response["employeeDetails"] as! [String:AnyObject]
                    self.salesAndTaxesArr = response["salesAndTaxesSummary"] as! [String:AnyObject]
                    self.tipsSummaryArr = response["tipSummary"] as! [String:AnyObject]
                            
                 let empName = self.themes.checkNullValue(self.employeeDetailsArr["employeeName"] as AnyObject) as! String
                               self.employeNameLbl.text = empName
                                          self.backActionLbl.text = "\(empName) Shift Review"
                let givenDate = self.themes.checkNullValue(self.employeeDetailsArr["date"] as AnyObject) as! String
                            if givenDate == ""{
                              self.dateLbl.text = ""
                            } else {
                            let dateString: String = givenDate
                            let dateFormatter1: DateFormatter = DateFormatter()
                            dateFormatter1.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
                            let yourDate: NSDate = dateFormatter1.date(from: dateString)! as NSDate
                            dateFormatter1.dateFormat = "EEEE MM/dd/yyyy h:mm a"
                            self.dateLbl.text = dateFormatter1.string(from: yourDate as Date)
                            }
                                                
                            self.firstTableView.delegate = self
                            self.firstTableView.dataSource = self
                            self.secondTableView.delegate = self
                            self.secondTableView.dataSource = self
                            self.firstTableView.reloadData()
                            self.secondTableView.reloadData()
                         } else {

                          }
                        }
                  } else {
                    self.themes.showAlert(title: "Oops ☹️", message: "No Internet", sender: self)
                         }
              }
            
}

//
//  DropDownVC.swift
//  RestaurantApp
//
//  Created by Naveen kunchal on 30/10/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit
protocol dropDownSelectDelegate:class {
    func dropDownSelect(delayTime:String,snoozedispaly:String)
}
class DropDownVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var dropdownTableview: UITableView!
    weak var delegate:dropDownSelectDelegate?
    var dropdownArr = ["20 Minutes","40 Minutes","Today"]
    var dropArr = ["20","40","today"]

    override func viewDidLoad() {
        super.viewDidLoad()
        dropdownTableview.delegate = self
        dropdownTableview.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if !(cell != nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
           }
        cell?.textLabel?.text = dropdownArr[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let delaytime = dropArr[indexPath.row]
        let dispaly = dropdownArr[indexPath.row]
        delegate?.dropDownSelect(delayTime: delaytime, snoozedispaly: dispaly)
        self.dismiss(animated: true, completion: nil)

    }
    


}

//
//  ViewItemsVC.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 18/09/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class ViewItemsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance

    @IBOutlet var vcBackView: UIView!
    @IBOutlet var backView: UIView!
    
    @IBOutlet var itemsTableView: UITableView!
    @IBOutlet var totalDueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        vcBackView.layer.cornerRadius = 8
        vcBackView.layer.masksToBounds = true
        backView.layer.cornerRadius = 8
        backView.layer.masksToBounds = true
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        self.itemsTableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
        self.itemsTableView.register(UINib(nibName: "SubItemTableViewCell", bundle: nil), forCellReuseIdentifier: "SubItemTableViewCell")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell") as! ItemsTableViewCell
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubItemTableViewCell", for: indexPath) as! SubItemTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}

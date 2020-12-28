//
//  RegisterswipeCardVC.swift
//  RestaurantApp
//
//  Created by nagaraj  kumar on 13/08/20.
//  Copyright © 2020 INDOBYTES. All rights reserved.
//

import UIKit

class RegisterswipeCardVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var themes = Themes()
    var urlService = URLservices.sharedInstance
    
    var selectedCellHint = Int()

    @IBOutlet var vcBackView: UIView!
    @IBOutlet var registerCardsTableView: UITableView!
    
    @IBOutlet var switchUserWidth: NSLayoutConstraint!
    @IBOutlet var switchUserImage: UIImageView!
    @IBOutlet var optionsBtn: UIButton!
    
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var addBtnImage: UIImageView!
    
    @IBOutlet var hideView: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var popCancelBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedCellHint = -1
        addBtn.isHidden = true
        addBtnImage.isHidden = true
        vcBackView.layer.cornerRadius = 8
        registerCardsTableView.delegate = self
        registerCardsTableView.dataSource = self
        registerCardsTableView.register(UINib(nibName: "EmployeesTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeesTableViewCell")
        
        hideView.isHidden = true
        popUpView.isHidden = true
        popUpView.layer.cornerRadius = 8
        popUpView.layer.masksToBounds = true
        popCancelBtn.applyGradient(colors: [grtadientRed.cgColor, gradientYellow.cgColor])
        popCancelBtn.layer.cornerRadius = 5
        popCancelBtn.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchUserAction(_ sender: Any) {
    }
    
    @IBAction func optionsAction(_ sender: Any) {
    }
    
    @IBAction func addAction(_ sender: Any) {
        hideView.isHidden = false
        popUpView.isHidden = false
    }
    
    @IBAction func popCancelAction(_ sender: Any) {
        hideView.isHidden = true
        popUpView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeesTableViewCell", for: indexPath) as! EmployeesTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = registerCardsTableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! EmployeesTableViewCell
        selectedCellHint = indexPath.row
        registerCardsTableView.reloadData()
        addBtn.isHidden = false
        addBtnImage.isHidden = false
        switchUserImage.isHidden = true
        switchUserWidth.constant = 0
        optionsBtn.isHidden = true
        cell.backView.applyGradientView(colors: [gradientBlue.cgColor, gradientGreen.cgColor])
    }
      
}

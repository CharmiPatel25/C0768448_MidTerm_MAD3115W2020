//
//  CustomerDetailsViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var lblCustID: UILabel!
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    
    @IBOutlet weak var lblLastName: UILabel!
    
    
    @IBOutlet weak var lblUserName: UILabel!
    
    
    @IBOutlet weak var lblEmailId: UILabel!
    
    @IBOutlet weak var lblDateOfBirth: UILabel!
    
    @IBOutlet weak var imgBill: UIImageView!
    
    
     var customers: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCustID.text = customers?.customerID
        self.lblFirstName.text = customers?.firstName
        self.lblLastName.text = customers?.lastName
        self.lblUserName.text = customers?.userName
        self.lblEmailId.text = customers?.emailID
        self.lblDateOfBirth.text = customers?.dateOfBirth
        imgBill.isUserInteractionEnabled = true
        imgBill.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.clickImage)))
    }
    

   @objc func clickImage() {
       let sb = UIStoryboard(name: "Main", bundle: nil)
       let billDetailsVC = sb.instantiateViewController(identifier: "billDetailsVC") as! ShowBillDetailsViewController
       billDetailsVC.customerBill = self.customers
       navigationController?.pushViewController(billDetailsVC, animated: true)
   }

}

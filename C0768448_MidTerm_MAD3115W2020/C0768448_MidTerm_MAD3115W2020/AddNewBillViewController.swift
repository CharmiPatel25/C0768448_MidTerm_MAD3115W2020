//
//  AddNewBillViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController {
    
    @IBOutlet weak var segBillType: UISegmentedControl!
    @IBOutlet weak var txtBillID: UITextField!
    @IBOutlet weak var txtBillDate: UITextField!
    @IBOutlet weak var txtMobilePlan: UITextField!
    @IBOutlet weak var txtMobileGBUsed: UITextField!
    @IBOutlet weak var txtHydroUnitConsumed: UITextField!
    @IBOutlet weak var txtHydroAgency: UITextField!
    @IBOutlet weak var txtMobileMinuteUsed: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtMobileManufacturer: UITextField!
    @IBOutlet weak var txtInternetProviderName: UITextField!
    
    
    var customer: Customer?

       var datePicker : UIDatePicker!
      
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "Add New Bill"
        txtBillDate.delegate = self
    }
    
   
    
  
        
   
    
   
        
    

}

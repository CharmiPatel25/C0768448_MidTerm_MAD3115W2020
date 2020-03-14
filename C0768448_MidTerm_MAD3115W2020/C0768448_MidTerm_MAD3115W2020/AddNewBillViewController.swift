//
//  AddNewBillViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController,UITextFieldDelegate {
    
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
    @IBOutlet weak var txtInternetGBUsed: UITextField!
    
    
    var customer: Customer?

       var datePicker : UIDatePicker!
      
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "Add New Bill"
        txtBillDate.delegate = self
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
           self.pickUpDate(self.txtBillDate)
       }
  
        func pickUpDate(_ textField: UITextField)
        {
          //Date Picker
          self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
          self.datePicker.backgroundColor = UIColor.white
          self.datePicker.datePickerMode = UIDatePicker.Mode.date
          textField.inputView = self.datePicker
           
          //Toolbar
          let toolBar = UIToolbar()
          toolBar.barStyle = .default
          toolBar.isTranslucent = true
          toolBar.tintColor = .red
          toolBar.sizeToFit()
           
          //Adding Button Toolbar
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewBillViewController.doneClick))
          let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewBillViewController.cancelClick))
          toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
          toolBar.isUserInteractionEnabled = true
          textField.inputAccessoryView = toolBar
        }
   
    @objc func doneClick()
    {
      let dateformatter1 = DateFormatter()
      dateformatter1.dateStyle = .medium
      dateformatter1.timeStyle = .none
      txtBillDate.text = dateformatter1.string(from: datePicker.date)
      txtBillDate.resignFirstResponder()
    }
     
    @objc func cancelClick()
    {
      txtBillDate.resignFirstResponder()
    }
   
    @IBAction func segBillType(_ sender: UISegmentedControl) {
        
        
        if sender.selectedSegmentIndex == 0
        {
            txtBillID.isHidden = false
            txtBillDate.isHidden = false
            txtMobileManufacturer.isHidden = true
            txtMobileMinuteUsed.isHidden = true
            txtMobileNumber.isHidden = true
            txtMobileGBUsed.isHidden = true
            txtMobilePlan.isHidden = true
            txtInternetProviderName.isHidden = true
            txtInternetGBUsed.isHidden = true
            txtHydroAgency.isHidden = false
            txtHydroUnitConsumed.isHidden = false
        }
        else if sender.selectedSegmentIndex == 1
        
        {
             txtBillID.isHidden = false
             txtBillDate.isHidden = false
             txtMobileManufacturer.isHidden = true
             txtMobileMinuteUsed.isHidden = true
             txtMobileNumber.isHidden = true
             txtMobileGBUsed.isHidden = true
             txtMobilePlan.isHidden = true
             txtInternetProviderName.isHidden = false
             txtInternetGBUsed.isHidden = false
             txtHydroAgency.isHidden = true
             txtHydroUnitConsumed.isHidden = true
            
        }
        else if sender.selectedSegmentIndex == 2
        {
             txtBillID.isHidden = false
             txtBillDate.isHidden = false
             txtMobileManufacturer.isHidden = false
             txtMobileMinuteUsed.isHidden = false
             txtMobileNumber.isHidden = false
             txtMobileGBUsed.isHidden = false
             txtMobilePlan.isHidden = false
             txtInternetProviderName.isHidden = true
             txtInternetGBUsed.isHidden = true
             txtHydroAgency.isHidden = true
             txtHydroUnitConsumed.isHidden = true
        }
    }
    
    
    @IBAction func btnAddNewBill(_ sender: UIButton) {
        if segBillType.selectedSegmentIndex == 0
        {
            let bill = Mobile(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Mobile, manufacturerName: txtMobileManufacturer.text!, planName: txtMobilePlan.text!, mobileNumber: txtMobileNumber.text!, mobGbUsed: Int(txtMobileGBUsed.text!)!, minute: Int(txtMobileMinuteUsed.text!)!)
          
            customer?.newBill(bill: bill, billId: txtBillID.text!)
        }
        else if segBillType.selectedSegmentIndex == 1
        {
            let bill = Hydro(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Hydro, agencyName: txtHydroAgency.text!, unitsUsed: Double(txtHydroUnitConsumed.text!)!)
            
            customer?.newBill(bill:bill, billId: txtBillID.text!)
        }
        else if segBillType.selectedSegmentIndex == 2
        
        {
            let bill = Internet(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Mobile, providerName: txtInternetProviderName.text!, gbUsed: Double(txtInternetGBUsed.text!)!)
            
            customer?.newBill(bill: bill, billId: txtBillID.text!)
        }
        
    
        
    }
    

}

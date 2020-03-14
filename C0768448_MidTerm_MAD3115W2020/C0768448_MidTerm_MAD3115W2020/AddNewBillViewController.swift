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
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddBillViewController.doneClick))
          let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddBillViewController.cancelClick))
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
   
        
    

}

//
//  AddNewCustomerViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {

    
    @IBOutlet weak var txtCustId: UITextField!
    
    @IBOutlet weak var txtfirstName: UITextField!
    
    @IBOutlet weak var txtlastName: UITextField!
    
    @IBOutlet weak var txtEmailId: UITextField!
    
  
    @IBOutlet weak var txtBirthDate: UITextField!
    
   
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnAddNewCustomer(_ sender: UIButton) {
        if(txtCustId.text == "" || txtfirstName.text == "" || txtlastName.text == "" || txtEmailId.text == "" || txtBirthDate.text == "" || txtUserName.text == "" || txtPassword.text == "")
        {
            let alertController = UIAlertController(title:"Error", message: "Cannot leave field Empty.Please fill all fields!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        let c = Customer(customerId: txtCustId.text!, firstName: txtfirstName.text!, lastName: txtlastName.text!, email: txtEmailId.text!, userName: txtUserName.text!, password: txtPassword.text!, dateOfBirth: txtBirthDate.text!)
        
        DataStorage.getInstance().addCustomer(customer: c)
        
        
        let alertController = UIAlertController(title: "Success", message: "Customer Added Successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.exitView()}))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func exitView()
    {

        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NEW CUSTOMER"
        self.txtBirthDate.viewDatePicker(target: self, selector: #selector(clickDate))
        
    }
    
   
    @objc func clickDate() {
           if let datePicker = self.txtBirthDate.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateStyle = .medium
               self.txtBirthDate.text = dateformatter.string(from: datePicker.date)
           }
           self.txtBirthDate.resignFirstResponder() 
       }
    

   

}

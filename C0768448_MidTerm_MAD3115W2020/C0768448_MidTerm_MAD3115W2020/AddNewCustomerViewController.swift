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
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBAction func btnSaveCustomer(_ sender: UIButton) {
        
        let newCustID=txtCustId.text ?? ""
        let newFirstName=txtfirstName.text ?? ""
        let newLastName=txtlastName.text ?? ""
        let newEmail=txtEmailId.text ?? ""
        
        if txtCustId.text == ""
        {
            showAlertMessage(message: "Enter ID")
        }
        else if txtfirstName.text == ""
        {
            showAlertMessage(message: "Enter First name ")
        }
        else if txtlastName.text == ""
        {
            showAlertMessage(message: "Enter Last name")
        }
        else if txtEmailId.text == ""
        {
            showAlertMessage(message: "Enter EmailID")
        }
        else
        {
        
        DataStorage.getInstance().addCustomer(customer: Customer(customerID: newCustID, firstName: newFirstName, lastName: newLastName, emailID: newEmail))
        }
        
    }
    
    var newCustomer:[Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlertMessage(message: String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

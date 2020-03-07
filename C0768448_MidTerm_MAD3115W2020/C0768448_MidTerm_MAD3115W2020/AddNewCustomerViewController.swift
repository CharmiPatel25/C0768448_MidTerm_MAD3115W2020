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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

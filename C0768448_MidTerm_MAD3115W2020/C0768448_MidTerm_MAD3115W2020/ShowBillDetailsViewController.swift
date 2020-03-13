//
//  ShowBillDetailsViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    var customers:Customer?
    
    @IBOutlet weak var lblCustID: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmailID: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCustID.text = customers?.customerID
        self.lblFirstName.text = customers?.firstName
        self.lblLastName.text = customers?.lastName
        self.lblEmailID.text = customers?.emailID
    }
    
    
    

}

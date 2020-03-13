//
//  ShowBillDetailsViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    var customerBill: Customer?
    var bills = [Bill]()
   
    @IBOutlet weak var tblBills: UITableView!
    
    @IBOutlet weak var lblTotalBill: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblTotalBill.text = String(format:"$%.2f", ((customerBill?.billsTotal())!))
        
    }
    
    
    

}

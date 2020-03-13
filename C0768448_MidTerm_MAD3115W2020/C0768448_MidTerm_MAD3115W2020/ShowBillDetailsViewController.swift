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
        self.addBillButton()
    }
    private func addBillButton()
    {
        let newCustButton = UIBarButtonItem(title: "New Bill", style: .plain, target: self, action: #selector(self.addBill))
        self.navigationItem.rightBarButtonItem = newCustButton
    }
    
    @objc func addBill()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addNewBillVC = sb.instantiateViewController(identifier: "addNewBillVC") as! AddNewBillViewController
        addNewBillVC.selectedCustomer = self.customerBill
        navigationController?.pushViewController(addNewBillVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tblBills.reloadData()
    }
}


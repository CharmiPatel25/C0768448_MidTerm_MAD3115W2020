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
        self.bills = (customerBill?.getBills())!
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
        addNewBillVC.customer = self.customerBill
        navigationController?.pushViewController(addNewBillVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tblBills.reloadData()
    }
}

extension ShowBillDetailsViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillDetailTableViewCell") as! BillDetailTableViewCell
        let billList = bills[indexPath.row]
        if billList.billType == .Mobile{
            cell.lblBillID?.text = billList.billID
            cell.lblBillDate?.text = billList.billDate.formatDate()
            cell.lblBillAmt.text = String(format:"$%.2f", billList.billCalculate())
        }
        if billList.billType == .Hydro
        {
            cell.lblBillID?.text = billList.billID
            cell.lblBillDate?.text = billList.billDate.formatDate()
            cell.lblBillAmt.text = String(format:"$%.2f", billList.billCalculate())
        }
        if billList.billType == .Internet
        {
            cell.lblBillID?.text = billList.billID
            cell.lblBillDate?.text = billList.billDate.formatDate()
        cell.lblBillAmt.text = String(format:"$%.2f", billList.billCalculate())
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150.0)
    }
 }


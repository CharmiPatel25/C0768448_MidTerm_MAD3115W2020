//
//  CustomerListTableViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {
    
    @IBOutlet weak var customerTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.addlogOutButton()
            self.addNewCustomerButton()
            self.navigationItem.hidesBackButton = true
        }
        
        override func viewWillAppear(_ animated: Bool) {
            self.customerTableView.reloadData()
        }
            
        private func addlogOutButton()
        {
            let logOutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logOut))
            self.navigationItem.leftBarButtonItem = logOutButton
        }
        
        @objc func logOut()
        {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = sb.instantiateViewController(identifier: "loginVC") as! LoginViewController
            navigationController?.pushViewController(loginVC, animated: true)
        }
        
        private func addNewCustomerButton()
        {
            let newCustomerButton = UIBarButtonItem(title: "Add Customer", style: .plain, target: self, action: #selector(self.addCustomer))
            self.navigationItem.rightBarButtonItem = newCustomerButton
        }
        
        @objc func addCustomer()
        {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewCustomerVC = sb.instantiateViewController(identifier: "AddNewCustomerVC") as! AddNewCustomerViewController
            navigationController?.pushViewController(addNewCustomerVC, animated: true)
        }
        

    }
       extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate
       {
           func numberOfSections(in tableView: UITableView) -> Int
           {
               return 1
           }
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
           {
            return DataStorage.getInstance().cus
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
           {
               let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell")
               let customerArray = DataStorage.getInstance().dictionaryToArray()
               let customer = customerArray[indexPath.row]
            cell?.textLabel?.text = customer.firstName
               return cell!
           }
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let customers = DataStorage.getInstance().dictionaryToArray()
                let selectedCustomer = customers[indexPath.row]
                
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let detailCustomerVC = sb.instantiateViewController(identifier: "custDetailsVC") as CustomerDetailsViewController
                let billDetails = sb.instantiateViewController(identifier: "showBillDetailsVC") as ShowBillDetailsViewController
                detailCustomerVC.customers = selectedCustomer
                billDetails.customerBill = selectedCustomer
                self.navigationController?.pushViewController(detailedCustomerVC, animated: true)
            }
    
    
    
    
    
        
        
        
    }

    

   



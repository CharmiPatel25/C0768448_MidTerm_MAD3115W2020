//
//  Customer.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Customer
{
    var customerID: String
    var firstName:String
    var lastName:String
    var fullName:String
    {
      return "\(firstName) \(lastName)"
    }
    var emailID:String
    var totalBillToPay : Double = 0.0
    var userName: String?
    var password:String?
    var dateOfBirth: String?
    lazy var customerBills = [String: Bill]()
    
    
    init(customerId: String, firstName: String,lastName: String, email: String, userName: String, password: String, dateOfBirth: String) {
        self.customerID = customerId
        self.firstName   = firstName
        self.emailID = email
        self.userName = userName
        self.password = password
        self.dateOfBirth = dateOfBirth
        
    }
    
    func newBill(bill: Bill, billId: String)
        {
          customerBills.updateValue(bill, forKey: billId)
        }
    
    func billsTotal() -> Double
    {
      var allTotal2 = 0.0
      for i in customerBills{
        allTotal2 += i.value.totalAmount
      }
      return allTotal2
    }
    
    func getBills() -> [Bill]{
        var bills = [Bill]()
        for i in customerBills{
            bills.append(i.value)
        }
        return bills
}
}

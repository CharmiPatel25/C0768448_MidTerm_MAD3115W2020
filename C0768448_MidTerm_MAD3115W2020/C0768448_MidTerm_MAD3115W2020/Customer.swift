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
     
    init(customerID:String, firstName:String, lastName:String, emailID:String) {
      self.customerID=customerID
      self.firstName=firstName
      self.lastName=lastName
      self.emailID=emailID
    }
}

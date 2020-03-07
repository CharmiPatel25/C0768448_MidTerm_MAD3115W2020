//
//  DataStorage.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class DataStorage
{
    
    private static let instance = DataStorage()
    private lazy var customerList: [String: Customer] = [:]

    private init(){}

    static func getInstance() -> DataStorage
    {
        return instance
    }
    
    func addCustomer(customer: Customer)
    {
        self.customerList.updateValue(customer, forKey: customer.customerID)
    }
    func getAllCustomers() -> [Customer]{
        return Array(customerList.values)
    }
    func loadData()
    {
        
        customerList.updateValue(Customer(customerID: "C001", firstName: "Jon", lastName: "Snow", emailID: "jonsnow@gmail.com"), forKey: "C01")
        customerList.updateValue(Customer(customerID: "C002", firstName: "Sansa", lastName: "Stark", emailID: "sansa@gmail.com"), forKey: "C02")
        customerList.updateValue(Customer(customerID: "C003", firstName: "Joffery", lastName: "Batatheon", emailID: "joffery@gmail.com"), forKey: "C03")
        customerList.updateValue(Customer(customerID: "C004", firstName: "Ned", lastName: "Mormont", emailID: "ned@gmail.com"), forKey: "C04")
        customerList.updateValue(Customer(customerID: "C005", firstName: "Danerys", lastName: "Targeryen", emailID: "danny@gmail.com"), forKey: "C05")
        
        
        
    }
    
}

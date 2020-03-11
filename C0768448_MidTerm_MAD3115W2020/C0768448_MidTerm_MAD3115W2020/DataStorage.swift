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
    private lazy var customerList = Dictionary<String,Customer>()

    private init(){}

    static func getInstance() -> DataStorage
    {
        return instance
    }
    
    func addCustomer(customer: Customer)
    {
        let custID = customer.customerID
        customerList.updateValue(customer, forKey: custID)
    }
    func getAllCustomers() -> [Customer]{
        return Array(customerList.values)
    }
    func loadData()
    {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let c1 =  Customer(customerId: "C001", firstName: "Jon", lastName: "Snow", email: "jon@gmail.com", userName: "jon", password: "jon123", dateOfBirth: "Apr 27, 1995")
        let c2 =  Customer(customerId: "C002", firstName: "Sansa", lastName: "Stark", email: "sansa@gmail.com", userName: "sansa ", password: "sansa123", dateOfBirth: "Nov 25,1993")
        let c3 =  Customer(customerId: "C003", firstName: "Danerys", lastName: "Targeryen", email: "danny@gmail.com", userName: "danny", password: "danny123", dateOfBirth: "Mar 28,1996")
        
        
        let m1 =  Mobile(billId: "MB001", billDate: formatter.date(from: "2019/10/12")!, billType: BillType.Mobile, manufacturerName: "APPLE INC.", planName: "Unlimited Plan", mobileNumber: "1245789635", mobGbUsed: 2, minute: 15)
        let m2 = Mobile(billId: "MB002", billDate: formatter.date(from: "2019/06/18")!, billType: BillType.Mobile, manufacturerName: "FIDO", planName: "LTE+3G 9.5GB Promo plan", mobileNumber: "4371029230", mobGbUsed: 2, minute: 11)
        
        let h1 = Hydro(billId: "HY001", billDate: formatter.date(from: "2019/09/12")!, billType: BillType.Hydro, agencyName: "PUREWATA", unitsUsed: 22.21)
        let h2 = Hydro(billId: "HY002", billDate: formatter.date(from: "2019/05/15")!, billType: BillType.Hydro, agencyName: "LIFELINE", unitsUsed: 8.2)
        
        
        let in1 = Internet(billId: "IN001", billDate: formatter.date(from: "2019/09/20")!, billType: BillType.Internet, providerName: "SKYLINK", gbUsed: 22.8)
        let in2 = Internet(billId: "IN002", billDate: formatter.date(from: "2019/10/12")!, billType: BillType.Internet, providerName: "STARLIGHT", gbUsed: 6.2)
           c1.newBill(bill: m1, billId: "MB100")
           c2.newBill(bill: h2, billId: "HY200")
           c2.newBill(bill: in2, billId: "IN002")
           c3.newBill(bill: m2, billId: "MB002")
           c3.newBill(bill: in1, billId: "IN001")
           c3.newBill(bill: h1, billId: "MB001")
           c3.newBill(bill: h2, billId: "HY002")
           addCustomer(customer: c1)
           addCustomer(customer: c2)
           addCustomer(customer: c3)
        
        
    }
    
}

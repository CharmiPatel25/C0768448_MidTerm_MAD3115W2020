//
//  Bill.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-10.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
enum BillType
{
    case Mobile,Internet,Hydro,Insurance
}
public class Bill
{
    
    var billID:String
    var billDate:Date
    var totalAmount:Double=0
    var billType:BillType
    
    init(billID:String, billDate:Date,billType:BillType)
    {
        self.billID = billID
        self.billDate = billDate
        self.billType=billType
    }
    
    func billCalculate() -> Double
     {
    var billAmount = 0.0
        return billAmount
     }
    
    
}

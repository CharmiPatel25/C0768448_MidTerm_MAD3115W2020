//
//  Internet.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

class Internet: Bill
  {
  private var providerName: String
  private var gbUsed: Double

init(billId: String, billDate: Date, billType: BillType, providerName:String, gbUsed: Double)
  {
    self.providerName = providerName
    self.gbUsed = gbUsed
    super.init(billID: billId, billDate: billDate, billType: billType)
    self.totalAmount = billCalculate()
  }

override func billCalculate() -> Double{
       var billAmount = 0.0
    if( gbUsed < 10){
        billAmount = 2 * gbUsed
    }
    else {
        billAmount = 3 * gbUsed
    }
       return billAmount
   }

}


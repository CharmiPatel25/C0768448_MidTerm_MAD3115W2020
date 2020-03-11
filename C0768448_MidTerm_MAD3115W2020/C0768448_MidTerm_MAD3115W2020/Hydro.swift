//
//  Hydro.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

public class Hydro: Bill
{
private var agencyName: String = ""
private var unitsUsed: Double = 0.0

  init(billId: String, billDate: Date, billType: BillType, agencyName:String, unitsUsed: Double)
{
  self.agencyName = agencyName
  self.unitsUsed = unitsUsed
    super.init(billID: billId, billDate: billDate, billType: billType)
    self.totalAmount = billCalculate()
}

override func billCalculate() -> Double
{
       var billAmount = 0.0
    if (unitsUsed < 10)
    {
        billAmount = 2 * unitsUsed
    }
    else
    {
        billAmount = 3 * unitsUsed
    }
return billAmount
  }
}

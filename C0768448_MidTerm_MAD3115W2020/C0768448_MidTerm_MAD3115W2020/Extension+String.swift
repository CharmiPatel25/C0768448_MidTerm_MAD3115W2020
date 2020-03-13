//
//  Extension+String.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit
extension Date{

public func formatDate() -> String
 {
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "MMM dd, yyyy"
     let formattedDate = dateFormatter.string(from: self)
     return formattedDate
 }
}

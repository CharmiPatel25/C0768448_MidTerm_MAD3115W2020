//
//  Extension+String.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
extension String {
  func toDate(withFormat format: String = "MMM dd, yyyy") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Incorrect Format")
    }
    return date
  }
}

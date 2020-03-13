//
//  CustomError.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

enum CustomError: Error
{
    case invalidEmail(email: String)
}

struct CustomExpection {
private static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

static func email(email: String) -> Bool {
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    if !emailPred.evaluate(with: email){
        return false
    }
    return true
}
}

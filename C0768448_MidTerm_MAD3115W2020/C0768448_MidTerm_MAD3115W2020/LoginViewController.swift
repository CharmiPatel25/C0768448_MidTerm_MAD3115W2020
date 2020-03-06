//
//  ViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-04.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var RememberMe: UISwitch!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if (txtEmailId.text == "" || txtPassword.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "EmailId or password is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



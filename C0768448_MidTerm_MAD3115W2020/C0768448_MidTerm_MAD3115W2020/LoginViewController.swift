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
    @IBOutlet weak var rememberMe: UISwitch!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rememberMeSwitchValue()
        // Do any additional setup after loading the view.
    }
    
    func rememberMeSwitchValue()
    {
        let userDefault = UserDefaults.standard
        
        if let userName = userDefault.string(forKey: "emailId")
        {
            txtEmailId.text = userName
            
            if let pwd = userDefault.string(forKey: "password")
            {
                txtPassword.text = pwd
            }
        }
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if (txtEmailId.text == "" || txtPassword.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "EmailID or password is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
        else if(txtEmailId.text == "charmi" && txtPassword.text == "patel"
        )
        {
            
            let userDefault = UserDefaults.standard
            if rememberMe.isOn
            {
                
                userDefault.setValue(txtEmailId.text, forKey: "emailId")
                userDefault.set(txtPassword.text, forKey: "password")
            }
            else
            {
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
            }
            
        }
        else
        {
            let alert = UIAlertController(title: "Invalid User", message: "Incorrect EmailID or password!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    
   
    
    


}



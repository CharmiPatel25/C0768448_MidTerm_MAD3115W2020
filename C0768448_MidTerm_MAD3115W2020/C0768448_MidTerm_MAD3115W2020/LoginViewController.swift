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
        txtEmailId.text = ""
        txtPassword.text = ""
        let ud = UserDefaults.standard
        let name = ud.string(forKey:"name")
        let password = ud.string(forKey: "password")
        self.navigationItem.hidesBackButton = true
        if let nm = name
            {
                txtEmailId.text = nm
            }
        if let pw  = password
            {
                txtPassword.text = pw
            }
    }
    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        
        
        if (txtEmailId.text == "" || txtPassword.text == "")
            {
          let alertController = UIAlertController(title: "Error", message: "Username/Password cannot be Empty", preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
          self.present(alertController, animated: true, completion: nil)
            }

        let customers = DataStorage.getInstance().dictionaryToArray()
        
        for i in customers
        {
            if (txtEmailId.text == i.userName && txtPassword.text == i.password)
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let customerListTableVC = sb.instantiateViewController(identifier: "customerListTableVC") as! CustomerListTableViewController
                navigationController?.pushViewController(customerListTableVC, animated: true)

                if rememberMe.isOn
                    {
                    let defaults = UserDefaults.standard
                        _ = defaults.set(txtEmailId.text, forKey: "name")
                        _ = defaults.set(txtPassword.text, forKey: "password")
                    }
                    
                else{
                    UserDefaults.standard.removeObject(forKey: "name")
                    UserDefaults.standard.removeObject(forKey: "password")
                }
                return
            }
        }
                let alertController = UIAlertController(title: "Error", message: "Incorrect username/  or password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
        


 }
}



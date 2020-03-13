//
//  AddNewBillViewController.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController {
    
    @IBOutlet weak var segBillType: UISegmentedControl!
    
    @IBOutlet weak var txtBillID: UITextField!
    @IBOutlet weak var txtBillDate: UITextField!
    
    @IBOutlet weak var txtMobileMins: UITextField!
    @IBOutlet weak var txtMobileData: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    
    @IBOutlet weak var txtMobileManufacture: UITextField!
    @IBOutlet weak var txtMobilePlan: UITextField!
    @IBOutlet weak var txtHydroProvider: UITextField!
    @IBOutlet weak var txtHydroUnits: UITextField!
    @IBOutlet weak var txtInternetProvider: UITextField!
    @IBOutlet weak var txtInternetData: UITextField!
    
    
    var selectedCustomer: Customer?
       var currentSelected: Int = 0
       var datePicker : UIDatePicker!
       var pickerView : UIPickerView!
       var billType = ["Mobile" , "Internet" , "Hydro"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.txtBillDate.viewDatePicker(target: self, selector: #selector(clickDone))
        self.hideText()
    }
    
    @objc func clickDone() {
           if let datePicker = self.txtBillDate.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateStyle = .medium
               self.txtBillDate.text = dateformatter.string(from: datePicker.date)
           }
           self.txtBillDate.resignFirstResponder()
       }
    
    @IBAction func btnAddBill(_ sender: UIButton) {
        if (segBillType.selectedSegmentIndex == 0){
                   
                       if((txtBillID.text?.contains("MB"))!){
                        let bill = Mobile(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Mobile, manufacturerName: txtMobileManufacture.text!, planName: txtMobilePlan.text!, mobileNumber: txtMobileNumber.text!, mobGbUsed: Int(txtMobileData!.text!)!, minute: Int(txtMobileMins!.text!)!)
                    selectedCustomer?.newBill(bill: bill, billId: txtBillID.text!)
                           billAdded()
                       }
                       else{
                           let alertController = UIAlertController(title:"Error", message: "Invalid Mobile Bill", preferredStyle: .alert)
                           alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                           self.present(alertController, animated: true, completion: nil)
                           return
                       }
                   
                  
               }
               if(segBillType.selectedSegmentIndex == 1){
                   if((txtBillID.text?.contains("HY"))!){
                    let bill = Hydro(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Hydro, agencyName: txtHydroProvider.text!, unitsUsed: Double(txtHydroUnits!.text!)!)
                    
                   selectedCustomer?.newBill(bill: bill, billId: txtBillID.text!)
                   billAdded()
                   }
                   else {
                       let alertController = UIAlertController(title:"Error", message: "Invalid Hydro Bill", preferredStyle: .alert)
                       alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                       self.present(alertController, animated: true, completion: nil)
                       return
                   }
               }
               if(segBillType.selectedSegmentIndex == 2){
                   if((txtBillID.text?.contains("IN"))!){
                    let bill = Internet(billId: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.Internet, providerName: txtInternetProvider.text!, gbUsed: Double(txtInternetData!.text!)!)
                   selectedCustomer?.newBill(bill: bill, billId: txtBillID.text!)
                   billAdded()
                   }
                   else {
                       let alertController = UIAlertController(title:"Error", message: "Invalid Internet Bill", preferredStyle: .alert)
                       alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                       self.present(alertController, animated: true, completion: nil)
                       return
                   }
               }
    }
    
    
    
    func billAdded(){
        let alertController = UIAlertController(title: "Success", message: "Bill Added :) ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.dismissView()}))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadBillTable(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let showBillDetailsVC = sb.instantiateViewController(identifier: "billDetailsVC") as! ShowBillDetailsViewController
        navigationController?.pushViewController(showBillDetailsVC, animated: true)
    }
    
    func dismissView()
    {

        navigationController?.popViewController(animated: true)
    }
    
    func hideTextFirst(){
    self.txtMobileMins.isHidden = true
    self.txtMobileData.isHidden = true
    self.txtMobileManufacture.isHidden = true
    self.txtMobilePlan.isHidden = true
    self.txtMobileNumber.isHidden = true
    self.txtMobileManufacture.isHidden = false
    }
    func hideText(){
        self.txtHydroUnits.isHidden = true;
        self.txtHydroProvider.isHidden = true;
        self.txtInternetData.isHidden = true
        self.txtInternetProvider.isHidden = true
        self.txtMobileMins.isHidden = false
        self.txtMobileData.isHidden = false
        self.txtMobileManufacture.isHidden = false
        self.txtMobilePlan.isHidden = false
        self.txtMobileNumber.isHidden = false
        self.txtMobileManufacture.isHidden = false
    }
    
    @IBAction func segmentBillType(_ sender: Any) {
        
        if (segBillType.selectedSegmentIndex == 0) {
                    self.txtHydroUnits.isHidden = true;
                    self.txtHydroProvider.isHidden = true;
                    hideText()
                }
                if(segBillType.selectedSegmentIndex == 1) {
                    hideTextFirst()
                    self.txtHydroProvider.isHidden = false
                    self.txtHydroUnits.isHidden = false
                    self.txtInternetData.isHidden = true
                    self.txtInternetProvider.isHidden = true
      
                }
                if(segBillType.selectedSegmentIndex == 2){
                     hideTextFirst()
                    self.txtHydroProvider.isHidden = true
                    self.txtHydroUnits.isHidden = true
                    self.txtInternetData.isHidden = false
                    self.txtInternetProvider.isHidden = false
    }
    
}
}

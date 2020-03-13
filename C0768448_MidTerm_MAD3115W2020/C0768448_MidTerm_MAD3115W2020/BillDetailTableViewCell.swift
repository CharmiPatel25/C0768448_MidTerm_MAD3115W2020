//
//  BillDetailTableViewCell.swift
//  C0768448_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class BillDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblBillID: UILabel!
    
    @IBOutlet weak var lblBillDate: UILabel!
    
    @IBOutlet weak var lblBillAmt: UILabel!
    
    @IBOutlet weak var imgBillSign: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

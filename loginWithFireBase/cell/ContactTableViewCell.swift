//
//  ContactTableViewCell.swift
//  loginWithFireBase
//
//  Created by Rajeev on 28/04/23.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

   @IBOutlet var namelbl:UILabel!
    
    @IBOutlet var phonelbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

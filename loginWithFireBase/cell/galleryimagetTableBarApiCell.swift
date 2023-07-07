//
//  galleryimagetTableBarApiCell.swift
//  loginWithFireBase
//
//  Created by Rajeev on 08/05/23.
//

import UIKit

class galleryimagetTableBarApiCell: UITableViewCell {

    @IBOutlet var artworkUrl100: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        artworkUrl100.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

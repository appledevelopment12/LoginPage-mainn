//
//  gallerySecondViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 07/07/23.
//

import UIKit
import Kingfisher

class gallerySecondViewController: UIViewController {

  @IBOutlet  var galleyImage:UIImageView!
    
    static var h = [ToDo]()
    static   var j: UIImage? //= nil
    
    var bc = j
    override func viewDidLoad() {
        super.viewDidLoad()
        galleyImage.image = bc
    }
    

}

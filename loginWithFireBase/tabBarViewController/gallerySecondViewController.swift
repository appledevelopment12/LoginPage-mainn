//
//  gallerySecondViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 07/07/23.
//

import UIKit

class gallerySecondViewController: UIViewController {

  @IBOutlet  var galleyImage:UIImageView!
    
    static var h = [ToDo]()
    
    var bh = h
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("my    \(gallerySecondViewController.h)")
       // galleyImage.image = bh
    }
    

}

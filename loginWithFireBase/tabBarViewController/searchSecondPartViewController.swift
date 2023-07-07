//
//  searchSecondPartViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 15/05/23.
//

import UIKit
import Photos

class searchSecondPartViewController: UIViewController {

    @IBOutlet weak var myvImg: UIImageView!
    

 static   var imageA1: UIImage? = nil
 
    
    var c = imageA1
    
    @IBOutlet weak var searchSecondPartCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myvImg.image = c
    }
    
    
    
}

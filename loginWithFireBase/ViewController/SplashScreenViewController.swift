//
//  SplashScreenViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 02/07/23.
//SplashScreenViewController


import UIKit
import Firebase

class SplashScreenViewController: UIViewController {

    // login kumar.rohit512000@gmail.com  pass - Rohit@123
    
    override func viewDidLoad() {
        
            
            super.viewDidLoad()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5, execute: {
                if FirebaseAuth.Auth.auth().currentUser != nil
                {
                    self.performSegue(withIdentifier: "main2", sender: self)
                }
                else
                {
                    self.performSegue(withIdentifier: "jump", sender: nil)
                }
            })
        }
        
    }
    

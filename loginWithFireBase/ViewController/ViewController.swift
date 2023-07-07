//
//  ViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 21/04/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {

   
    
    @IBOutlet var login: UIButton!
    @IBOutlet var creatAcount: UIButton!
    @IBOutlet var forget: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseAuth.Auth.auth().currentUser != nil
        {
            self.performSegue(withIdentifier: "main", sender: self)
        }
       layOut()
    }
   
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {
        }
    }

    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func layOut()
    {
        // Do any additional setup after loading the view.
        login.layer.cornerRadius = 15
        creatAcount.layer.cornerRadius = 15
        forget.layer.cornerRadius = 15
        self.navigationItem.hidesBackButton = true
    }
}





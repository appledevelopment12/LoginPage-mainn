//
//  searchViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 27/04/23.
//

import UIKit
import Firebase
class searchViewController: UIViewController {

    @IBOutlet weak var logouutbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logouutbtn.layer.cornerRadius = 15
    }
    
    
    
    @IBAction func logOutButton(_ sender: UIButton)
    {
        
        do
        {
            try FirebaseAuth.Auth.auth().signOut()
           // logouutbtn.removeFromSuperview()
            logouutbtn.resignFirstResponder()
            print("logout is successful")
        }
        catch
        {
            print("An error occured")
        }
     
       exit(0)
    }
    
}

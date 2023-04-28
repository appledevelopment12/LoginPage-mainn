//
//  LoginViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 21/04/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var letsGoLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        letsGoLoginBtn.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: UIButton)
    {
        
        guard let email = emailTextField.text else{ return }
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error
            {
                //print("hiiiii")
                let a = UIAlertController(title: "Wrong", message: "Enter a valid password", preferredStyle: .alert)
                let okbutton = UIAlertAction(title: "Ok", style: .default){ (action) in }
                a.addAction(okbutton)
                self.present(a,animated: true,completion: nil)
            }
            else
            {
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
        
    }
    
    

}

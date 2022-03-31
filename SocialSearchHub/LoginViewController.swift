//
//  ViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/29/22.
//
// OWNER: Cassey

import UIKit
import Parse

class LoginViewController: UIViewController {
    let ParseDB = ParseDBAPI()
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        let logInResult = ParseDB.onLogIn(username: usernameTextField.text!, password: passwordTextField.text!)
        if (logInResult == true) {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            print("Error with logging in")
        }
    }
    
    // When the Sign Up button is pressed call this function
    @IBAction func onSignUp(_ sender: Any) {
        
        // Get SignUpViewController
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        // Present SignUpViewController
        self.present(signUpViewController, animated:true, completion:nil)
    }
}


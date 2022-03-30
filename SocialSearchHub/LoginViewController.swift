//
//  ViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/29/22.
//
// OWNER: Cassey

import UIKit

class LoginViewController: UIViewController {
    let ParseDB = ParseDBAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // When the Sign Up button is pressed call this function
    @IBAction func onSignUp(_ sender: Any) {
        
        // Get SignUpViewController
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        // Present SignUpViewController
        self.present(signUpViewController, animated:true, completion:nil)
    }
}


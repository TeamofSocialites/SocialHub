//
//  SignUpViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/29/22.
//
// OWNER: Cassey

import UIKit
import Parse

class SignUpViewController: UIViewController {
    let ParseDB = ParseDBAPI()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.isSecureTextEntry = true
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let signUpResult = ParseDB.signUp(email: emailTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!)
        
        if signUpResult == true {
            self.performSegue(withIdentifier: "signupSegue", sender: nil)
        } else {
            print("Error in Signing Up")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

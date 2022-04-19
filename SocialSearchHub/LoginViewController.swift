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
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // create the alert
     let alert = UIAlertController(title: "Error Logging In", message: "Invalid username/password", preferredStyle: .alert)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Helpful DEBUG messages for Instagram API
        let creds = InstagramCredentials()
        if (creds.instagramAccessToken == "ACCESS_TOKEN") {
            print("!!! READ: Replace Access Token with the code for the Instagram API to work. See Payton for more details. !!!")
        } else {
            print("!!!! READ: DO NOT push Access Token code to Github. Replace the access token with: 'ACCESS_TOKEN' before pushing to GitHub. !!!")
        }
        
        passwordTextField.isSecureTextEntry = true
        
        // add an action (button)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
          if (user != nil) {
              // The log in was successful
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
              print("The user has logged in!")
          } else {
              // There was an error.
              self.present(self.alert, animated: true, completion: nil)
              print(error ?? "There was an error logging the user in.")
          }
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


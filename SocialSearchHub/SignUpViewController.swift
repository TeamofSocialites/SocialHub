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

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.isSecureTextEntry = true
    }
    
    
    @IBAction func onBackButton(_ sender: Any) {
        // When Back button is presssed go back to LoginViewController
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated:true, completion:nil)
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser["email"] = emailTextField.text!
        newUser["username"] = usernameTextField.text!
        newUser["password"] = passwordTextField.text!
        newUser["darkMode"] = false
        newUser["favoriteSearches"] = [String]()
        newUser["darkMode"] = false // can be changed to system settings
        newUser.signUpInBackground { (success, error) in
          if (success) {
              print("New user has been created!")
              self.performSegue(withIdentifier: "signupSegue", sender: nil)
          } else {
              // There was a problem, check error.description
              print(error?.localizedDescription ?? "Signing the user up failed.")
          }
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

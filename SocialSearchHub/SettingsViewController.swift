//
//  SettingsViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/30/22.
//
// OWNER: Payton

import UIKit
import Parse

class SettingsViewController: UIViewController {

    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOut()
        print("The user was logged out!")
        
        // Transition to new screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated:true, completion:nil)
    }
    @IBOutlet weak var darkModeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.darkModeSwitch.isOn = getDarkModeValue()
    }
    
    @IBAction func onDarkModeSwitchValueChange(_ sender: Any) {
        // Toggle dark mode
        
        // Get App Delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return
        }
        
        
        if (darkModeSwitch.isOn) {
            // Update screens
            
        } else {
            // Update screens
            
        }
        
        // Save user choice database
        do {
            let user = PFUser.current()
            user?["darkMode"] = self.darkModeSwitch.isOn
            try user?.save()
            print("Dark mode was updated")
            
        } catch {
            print("Unable to update Dark Mode")

        }
    }
    
    func getDarkModeValue() -> Bool {
        let objectId = PFUser.current()?.objectId
        do {
            let user = try PFUser.query()?.getObjectWithId(objectId!)
            let darkMode = user!["darkMode"] as! Bool
            
            print(darkMode)
            return darkMode
            
        } catch {
            print("Unable to get Dark Mode from database")
            
            return false
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

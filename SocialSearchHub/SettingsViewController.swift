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
    
    let darkModeAPI = DarkModeAPI()

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
        
        self.darkModeSwitch.isOn = darkModeAPI.getUserDarkModeSettingFromDB()
    }
    
    @IBAction func onDarkModeSwitchValueChange(_ sender: Any) {
        // Toggle dark mode
        darkModeAPI.toggleDarkModeStyleInApp(darkModeSettingApplied: darkModeSwitch.isOn)
        
        // Save user choice database
        darkModeAPI.saveUserDarkModeSettingInDB(newDarkModeSetting: darkModeSwitch.isOn)
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

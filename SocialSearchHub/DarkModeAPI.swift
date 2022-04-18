//
//  DarkModeAPI.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 4/16/22.
//

import Foundation
import Parse

class DarkModeAPI {
    
    // Returns if the user has dark mode on/off from the database.
    func getUserDarkModeSettingFromDB() -> Bool {
        let objectId = PFUser.current()?.objectId
        do {
            let user = try PFUser.query()?.getObjectWithId(objectId!)
//            let darkMode = user!["darkMode"] as! Bool
            
            return false //change later
            
        } catch {
            print("Unable to get Dark Mode from database")
            
            return false
        }
    }
    
    // Save User Dark Mode Setting into database
    func saveUserDarkModeSettingInDB(newDarkModeSetting: Bool) {
        do {
            let user = PFUser.current()
            user?["darkMode"] = newDarkModeSetting
            try user?.save()
            print("Dark mode was updated")
            
        } catch {
            print("Unable to update Dark Mode")

        }
    }
    
    // Flips the style if dark mode is toggled to be correct.
    func toggleDarkModeStyleInApp(darkModeSettingApplied: Bool) {
        if #available(iOS 13, *) {
            let appDelegate = UIApplication.shared.windows.first
            
            if (darkModeSettingApplied) {
                appDelegate?.overrideUserInterfaceStyle = .dark
            } else {
                appDelegate?.overrideUserInterfaceStyle = .light
            }
        }
    }
}

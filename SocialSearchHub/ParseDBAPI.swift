////
////  ParseDBAPI.swift
////  SocialSearchHub
////
////  Created by Eva Keeling on 3/29/22.
////
//// OWNER: Payton
//
//import Foundation
//import Parse
//
//class ParseDBAPI {
//    // INPUTS: Email, Username, and Password
//    // OUTPUTS: Returns if the user was successfully signed up or not.
//    func signUp(email: String, username: String, password: String) -> Bool {
//        // Create new user
//        let newUser = PFUser()
//        newUser["email"] = email
//        newUser["username"] = username
//        newUser["password"] = password
//        newUser["favoriteSearches"] = []
//        newUser["darkMode"] = false
//
//        var signUpResult = false
//        newUser.signUp { (success, error) in
//
//        }
//        newUser.signUpInBackground { (success, error) in
//          if (success) {
//              print("New user has been created!")
//              signUpResult = true
//          } else {
//              // There was a problem, check error.description
//              print(error?.localizedDescription ?? "Signing the user up failed.")
//              signUpResult = false
//          }
//        }
//
//        return signUpResult
//    }
//
//    // INPUTS: Username, and Password
//    // OUTPUTS: Returns if the user was successfully logged in or not
////    func onLogIn(username: String, password: String) -> Bool {
////        var logInResult = false
////        PFUser.logInWithUsername(inBackground username: String, password: String) { (user, error) in
////          if (user != nil) {
////              // The log in was successful
////              logInResult = true
////              print("The user has logged in!")
////          } else {
////              // There was an error.
////              logInResult = false
////              print(error ?? "There was an error logging the user in.")
////          }
////        }
////
////        return logInResult
////    }
//
//    // INPUTS: N/A
//    // OUTPUTS: Returns if the user was successfully logged out or not.
//    // Make sure to segue to the Login screen in the storyboard code :)
//    // See: https://stackoverflow.com/questions/24099533/swift-presentviewcontroller
//    func onLogOut() -> Bool {
//        var loggedOut = false
//        PFUser.logOutInBackground(block: { (error) in
//            if error == nil {
//                loggedOut = true
//                print("User logged out!")
//            } else {
//                loggedOut = false
//                print(error ?? "There was an error logging out.")
//            }});
//
//            return loggedOut
//    }
//}

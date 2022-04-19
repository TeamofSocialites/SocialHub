//
//  SearchViewController.swift
//  SocialSearchHub
//
//  Created by Cassey Anene on 4/18/22.
//

import UIKit
import Parse

class SearchViewController: UIViewController {
    
    // create alert for empty search field
    let alert = UIAlertController(title: "Invalid Search", message: "Please enter a valid search", preferredStyle: .alert)
    var favoriteSearches = NSArray()
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var favorited:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserInfoFromDB()
        
        // add an action (button)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    
    
    @IBAction func onTextChange(_ sender: Any) {
        if self.favoriteSearches.contains(self.searchTextField.text!) { // TODO: Remove warning
            setFavoritedImage(true)
        } else {
            setFavoritedImage(false)
        }
    }
    
    @IBAction func onSearch(_ sender: Any) {
        
        if let searchText = self.searchTextField.text, searchText.isEmpty {
            self.present(self.alert, animated: true, completion: nil)
        } else {
            // Do the search using the APIs - wait for a response if needed
            
            // Segue the user
            self.performSegue(withIdentifier: "feedSegue", sender: nil)
            
        }
           
    }
    
    func setFavoritedImage(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favoriteButton.tintColor = UIColor.yellow
        }
        else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            favoriteButton.tintColor = UIColor.black
        }
        
    }
    
    
    @IBAction func setFavorite(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            // Add it to the users searches in the Parse Database
            if let currentUser = PFUser.current(){
                let currentFavoriteSearches = currentUser["favoriteSearches"] as? NSMutableArray
                currentUser["favoriteSearches"] = currentFavoriteSearches?.addingObjects(from: [self.searchTextField.text!])
                currentUser.saveInBackground()
            }
            
            self.setFavoritedImage(true)
        } else {
            // Remove it from the database
            if let currentUser = PFUser.current(){
                let currentFavoriteSearches = currentUser["favoriteSearches"] as? NSMutableArray
                currentFavoriteSearches?.removeObject(identicalTo:self.searchTextField.text!)
                currentUser["favoriteSearches"] = currentFavoriteSearches
                currentUser.saveInBackground()
            }
            self.setFavoritedImage(false)
        }
    }
    
    func getUserInfoFromDB() {
        // Special query for User object
        // https://docs.parseplatform.org/ios/guide/#querying
        var favoriteSearches = NSArray()
        let objectId = PFUser.current()?.objectId
        let _ = PFUser.query()
        do {
            let user = try PFUser.query()?.getObjectWithId(objectId!)
            favoriteSearches = user!["favoriteSearches"] as! NSArray
        } catch {
            print("Unable to get user info")
        }
        
        self.favoriteSearches = favoriteSearches
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

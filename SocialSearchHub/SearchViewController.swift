//
//  SearchViewController.swift
//  SocialSearchHub
//
//  Created by Cassey Anene on 4/18/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    // create alert for empty search field
    let alert = UIAlertController(title: "Invalid Search", message: "Please enter a valid search", preferredStyle: .alert)
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var favorited:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add an action (button)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
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
        }
        else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
    }
    
    
    @IBAction func setFavorite(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            // Add it to the users searches in the Parse Database
            self.setFavoritedImage(true)
        } else {
            // Remove it from the database
            self.setFavoritedImage(false)
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

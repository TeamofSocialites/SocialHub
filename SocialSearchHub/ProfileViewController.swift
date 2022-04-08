//
//  ProfileViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/29/22.
//
// OWNER: Payton

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var favoriteSearches = NSArray()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteSearches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteSearchTermCell", for: indexPath) as! FavoriteSearchTermTableViewCell
        
        cell.favoriteSearchTerm.text = favoriteSearches[indexPath.row] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getUserInfoFromDB()
    }
    
    func getUserInfoFromDB() {
        // Special query for User object
        // https://docs.parseplatform.org/ios/guide/#querying
        var favoriteSearches = NSArray()
        let objectId = PFUser.current()?.objectId
        let query = PFUser.query()
        do {
            let user = try PFUser.query()?.getObjectWithId(objectId!)
            favoriteSearches = user!["favoriteSearches"] as! NSArray
        } catch {
            print("Error occured")
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

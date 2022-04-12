//
//  HomeFeedViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/30/22.
//
// OWNER: Khalil

import UIKit

class HomeFeedViewController: UITableViewController {
    
   
    @IBOutlet var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = UITableView.automaticDimension
        homeTableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    override func numberOfSections(in homeTableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ homeTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweetcell = homeTableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        let instagramcell = homeTableView.dequeueReusableCell(withIdentifier: "InstagramCell", for: indexPath)
        
        if (indexPath.row % 2) == 0 {
            return tweetcell
        }
        
        return instagramcell
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

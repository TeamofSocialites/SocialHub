//
//  HomeFeedViewController.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/30/22.
//
// OWNER: Khalil

import UIKit
import AlamofireImage

class HomeFeedViewController: UITableViewController {

    var instagramPosts = [InstagramTopPostResponse.Post]()
   
    @IBOutlet var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = UITableView.automaticDimension
        homeTableView.rowHeight = UITableView.automaticDimension
        
        // Had issues with InstagramCell getting clipped. This code fixed.
        // TODO: Might need to replace "hacky" code in the future.
        homeTableView.estimatedRowHeight = 500
        homeTableView.rowHeight = 367
    }
    
    
    
    override func numberOfSections(in homeTableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // instagram posts count + twitter posts count
        return instagramPosts.count
    }
    
    override func tableView(_ homeTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweetcell = homeTableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        // TODO: Because indexPath is expected to be the sum of tweets and instagram posts, we need to handle the case where tweets or instagram posts are empty...
        // if ((indexPath.row % 2) == 0 || instagramPostsIndex >= instagramPosts.count) &&  !tweets.isEmpty)
        if (indexPath.row % 2) == 0 {
            return tweetcell
        } else {
            // Fill Instagram Cell, using indexPath.row because a class variable was giving unintended behavior.
            // TODO: Because indexPath.row, handle case when indexPath.row is out of bounds of instagram posts.
            let instagramcell = homeTableView.dequeueReusableCell(withIdentifier: "InstagramCell", for: indexPath) as! InstagramCell
            instagramcell.instagramCaptionLabel.text = instagramPosts[indexPath.row].caption
            instagramcell.buttonPressed = {
                // https://stackoverflow.com/questions/31628246/make-button-open-link-swift
                UIApplication.shared.openURL(NSURL(string: self.instagramPosts[indexPath.row].permalink)! as URL)
            }
            
            // Handle optional values
            
            // See. Used to convert Optional Int to String https://stackoverflow.com/questions/28290833/swift-how-to-cast-from-int-to-string
            instagramcell.likesLabel.text = instagramPosts[indexPath.row].like_count.flatMap {String ($0) } ?? "Hidden"
            instagramcell.commentLabel.text = instagramPosts[indexPath.row].comments_count.flatMap {String ($0) } ?? "Hidden"
            
            if ((instagramPosts[indexPath.row].media_url) != nil) {
                let url = URL(string: instagramPosts[indexPath.row].media_url!)!
                instagramcell.contentImage.af.setImage(withURL: url)
            } else {
                
            }
            
            return instagramcell
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

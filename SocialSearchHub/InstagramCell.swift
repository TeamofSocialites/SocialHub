//
//  InstagramCell.swift
//  SocialSearchHub
//
//  Created by Khalil Scott-Shepherd on 4/11/22.
//

import UIKit

class InstagramCell: UITableViewCell {
    
    // Create closure
    var buttonPressed : (() -> ()) = {}

    @IBAction func onButtonPressed(_ sender: Any) {
        buttonPressed()
    }
    
    @IBOutlet weak var instagramCaptionLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MatchesTableViewCell.swift
//  MatchAI
//
//  Created by Sashank Vempati on 4/26/20.
//  Copyright © 2020 Sashank Vempati. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var matchName: UILabel!
    
    @IBOutlet weak var matchAge: UILabel!
    
    @IBOutlet weak var compatibility: UILabel!
    
    @IBOutlet weak var matchCollege: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

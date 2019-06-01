//
//  LeagueTableViewCell.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

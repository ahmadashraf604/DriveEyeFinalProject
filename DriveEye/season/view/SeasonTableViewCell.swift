//
//  SeasonTableViewCell.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class SeasonTableViewCell: UITableViewCell {

    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var highScoreLAbel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var myRankLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

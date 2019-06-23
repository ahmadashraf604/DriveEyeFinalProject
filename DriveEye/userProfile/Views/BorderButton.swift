//
//  BorderButton.swift
//  DriveEye
//
//  Created by MacBookPro on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

import UIKit

class BorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.height/3.0
        
    }
    
}

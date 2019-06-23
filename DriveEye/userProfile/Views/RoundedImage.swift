//
//  RoundedImage.swift
//  DriveEye
//
//  Created by MacBookPro on 5/31/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

extension UIImageView {
        
    
    func roundedImg(){
    
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    

}

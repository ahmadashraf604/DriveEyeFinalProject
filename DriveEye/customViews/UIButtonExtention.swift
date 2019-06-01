
//  File.swift
//  DriveEye
//  Created by ashraf on 5/23/19.
//  Copyright © 2019 java. All rights reserved.


import Foundation
import UIKit

extension UIButton{
    
    open override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
}

//
//  UIStackViewExtention.swift
//  DriveEye
//
//  Created by ashraf on 6/17/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let myBounds: CGRect = CGRect(x: -20, y: -20, width: bounds.width + 40, height: bounds.height + 40)
        let subView = UIView(frame: myBounds)
        subView.layer.cornerRadius = 8.0
        subView.clipsToBounds = true
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

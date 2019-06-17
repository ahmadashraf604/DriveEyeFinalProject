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
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

//
//  emptyView.swift
//  DriveEye
//
//  Created by ashraf on 6/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "emptyCollection", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
}

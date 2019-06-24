//
//  AlertVC.swift
//  DriveEye
//
//  Created by ashraf on 5/24/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {
    
    var titlelable : String  = ""
    var descriptionlable : String = ""
    
    var gotItHandler : (()->())? = nil

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var coachTitle: UILabel!
    @IBOutlet weak var coachDescription: UILabel!
    @IBOutlet weak var coachImage: UIImageView!
    @IBAction func alertAction(_ sender: Any) {
        gotItHandler?()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        coachTitle.text = titlelable
        coachDescription.text = descriptionlable
        parentView.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

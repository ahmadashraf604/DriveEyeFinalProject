//
//  TipDetailsViewController.swift
//  DriveEye
//
//  Created by Sallam on 6/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class TipDetailsViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tfTitle: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var coachModel: Coach!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        stackView.addBackground(color: .white)
        img.image = coachModel.image
        tfTitle.text = coachModel.title
        tvDescription.text = coachModel.responseDescription
    }
    

}

//
//  EditProfileViewController.swift
//  DriveEye
//
//  Created by MacBookPro on 5/27/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profilePicImage: UIImageView!
    
    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var carBrandTextField: UITextField!
    
    @IBOutlet weak var carModelTextField: UITextField!
    
    @IBOutlet weak var carReleaseYearTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeProfilePicImageTapped(_ sender: Any) {
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
    }
}

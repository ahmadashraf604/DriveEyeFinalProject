//
//  RegisterViewController.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterVCProtocol{
    func showAlert(msg: String) {
        
    }
    
    
    
    let presenter = RegistrationPresenter(userModel: UserModel())

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setVCDelegate(vcDelegate: self)

        // Do any additional setup after loading the view.
    }

    
    func loadCitiesFromWebService() -> [String] {
        return []
    }
    
    
    @IBAction func btnSelectCityAction(_ sender: Any) {
        
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        
    }
    
}

//
//  CarRegViewController.swift
//  DriveEye
//
//  Created by Sallam on 6/16/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class CarRegViewController: UIViewController, CarVCDelegate{
    func showAlert(msg: String) {
        
    }
    
    func goToHomeScreen() {
        let homeScreen = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = homeScreen.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfModel: UITextField!
    @IBOutlet weak var tfReleaseYear: UITextField!
    
    let presenter = RegistrationPresenter(userModel: UserModel())

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setVCDelegate(vcDelegate: self)
    }

    @IBAction func btnFinishAction(_ sender: Any) {
        if (tfBrand.text != nil) && (tfModel.text != nil) {
            
            let car = Car(brand: tfBrand.text!, model: tfModel.text!)
            presenter.addCarToUser(userId: Utils.getCurrentUserId(), carInfo: car)
            
        }
    }
}

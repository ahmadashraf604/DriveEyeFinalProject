//
//  RegisterViewController.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterVCProtocol, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var btnSelectCity: UIButton!
    @IBOutlet weak var citiesTableView: UITableView!
    
    @IBOutlet weak var tfPassword: UITextField!
//    @IBOutlet weak var tfCarBrand: UITextField!
//    @IBOutlet weak var tfCarModel: UITextField!
    
    var cities: [City] = []
    let presenter = RegistrationPresenter(userModel: UserModel())
    var cityId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.isHidden = true
        presenter.setRegisterVCDelegate(vcDelegate: self)
        loadCitiesFromWebService()
        citiesTableView.reloadData()
    }
    
    func animateTableView(toggle: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.citiesTableView.isHidden = toggle
        })
    }

    func loadCitiesFromWebService() {
        presenter.getAllCities()        
    }
    
    func populateCitiesTable(cities: CitiesResponse) {
        self.cities = cities.response
        citiesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnSelectCity.setTitle(cities[indexPath.row].name, for: .normal)
        animateTableView(toggle: true)
        cityId = cities[indexPath.row].cityId
    }
    
    func showAlert(msg: String) {
        
    }
    
    func goToHomeScreen() {
        let homeScreen = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = homeScreen.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    
    func goToCarScreen() {
        let carScreen = UIStoryboard(name: "LoginAndRegistraion", bundle: nil)
        let vc = carScreen.instantiateViewController(withIdentifier: "carController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnSelectCityAction(_ sender: Any) {
        
        if citiesTableView.isHidden == true {
            animateTableView(toggle: false)
        } else {
            animateTableView(toggle: true)
        }
        
    }
    
    @IBAction func btnNext(_ sender: Any) {
        var user: UserToReg?
        
        if (tfFirstName.text != nil) && (tfLastName.text != nil) && (tfPhone.text != nil ) &&
            (tfEmail.text != nil) && (tfPassword.text != nil) && (cityId != nil) {
            
            user = UserToReg(firstName: tfFirstName.text!, lastName: tfLastName.text!, email: tfEmail.text!, password: tfPassword.text!, birthDate: datePicker.date, cityId: cityId!, phone: tfPhone.text!)
            
//            car = Car(brand: tfCarBrand.text!, model: tfCarModel.text!)
            presenter.registerUser(userInfo: user!)

        }
//        if (tfCarBrand.text != nil) && (tfCarModel.text != nil) {
//            car?.brand = tfCarBrand.text!
//            car?.model = tfCarModel.text!
//        }
        
//        print(user!)
        
    }
    
}

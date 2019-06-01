//
//  LocationService.swift
//  DriveEye
//
//  Created by ashraf on 5/30/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: NSObject ,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    func getCityAndCountry() {
        
    }
    
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location : CLLocation = manager.location else{return}
        getCityAnd { (city, country, error) in
            guard let city = city , let  country = country , error == nil else { return }
         
        }
    }
     func getCityAnd( country completion : @escaping (_ city :String? ,_ country : String? ,_ error :Error?  )-> ()){
        var location = CLLocation ()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality, placemarks?.first?.country, error)
        }
    }
}

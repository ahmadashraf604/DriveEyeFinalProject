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
    
    var countryClouser:((_ city :String? ,_ country : String? ,_ error :Error?  )-> ())?
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location : CLLocation = manager.location else{return}
        CLGeocoder().reverseGeocodeLocation(location)  {[weak self]placemarks ,error in
            self?.countryClouser?(placemarks?.first?.locality!, placemarks?.first?.country!, nil)
        }
        locationManager.stopUpdatingLocation()
        
    }
    
    func getCityAnd( country completion : @escaping (_ city :String? ,_ country : String? ,_ error :Error?  )-> ()){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.countryClouser = completion
            locationManager.startUpdatingLocation()
            
        }
        
    }
}

//
//  AlertServices.swift
//  DriveEye
//
//  Created by ashraf on 5/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class AlertServices {
    func alert(title : String ,describtion:String ,gotItOnClick dismiss:@escaping ()->() ) -> AlertVC{
        let alert = UIStoryboard(name: "AlertStoryboard", bundle: .main).instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
        alert.titlelable=title;
        alert.descriptionlable=describtion
        alert.gotItHandler = dismiss
        return  alert ;
    }
}

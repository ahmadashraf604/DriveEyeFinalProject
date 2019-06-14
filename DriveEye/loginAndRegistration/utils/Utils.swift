//
//  Utils.swift
//  DriveEye
//
//  Created by Sallam on 5/31/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

class Utils {
    
    static let USER_ID_KEY = "userId"
    
    static func saveCurrentUserId(userID: Int){
        UserDefaults.standard.set(userID, forKey: USER_ID_KEY)
    }
    
    static func getCurrentUserId() -> Int {
        return UserDefaults.standard.integer(forKey: USER_ID_KEY)
    }
    
}


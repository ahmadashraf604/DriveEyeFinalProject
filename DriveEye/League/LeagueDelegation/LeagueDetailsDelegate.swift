//
//  LeagueDetailsDelegate.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

protocol LeagueDetailsDelegate {
    
    func setLeagueUsers(users: [UserLeague])
    
    func displayNoData()
    
    func displayNetworkError(error: String)
}

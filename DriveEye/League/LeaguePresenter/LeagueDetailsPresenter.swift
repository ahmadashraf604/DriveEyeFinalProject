//
//  LeagueDetailsPresenter.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter {
    
    private let userID = 1
    private var leagueVC: LeagueDetailsDelegate
    private let leagueModel: LeagueModel
    
    init(leagueVC: LeagueDetailsDelegate) {
        self.leagueModel = LeagueModel()
        self.leagueVC = leagueVC
    }
    
    func getUsers(leagueID: Int) {
        leagueModel.getLeagueUsers(leagueID: leagueID, responseHandel: {(users) in
            self.leagueVC.setLeagueUsers(users: users)
        })
    }
}

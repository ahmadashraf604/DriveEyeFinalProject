//
//  LeagueAlertPresenter.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

class LeagueAlertPresenter {
    
    private let userID: Int = 1
    private var leagueVC: LeagueAlertDelegate
    private let leagueModel: LeagueModel
    
    init(leagueVC: LeagueAlertDelegate) {
        self.leagueModel = LeagueModel()
        self.leagueVC = leagueVC
    }
    
    func addLeague(leagueName: String) {
        leagueModel.addLeague(leagueName: leagueName, userID: self.userID, responseHandel: {(reponse) in
            self.leagueVC.dismissView(league: reponse.league)
        }, errorHandel: {(errorResponse) in
            self.leagueVC.printError(error: errorResponse.error)
        })
    }
    
    func joinLeague(leagueCode: String) {
        leagueModel.joinLeague(leagueCode: leagueCode, userID: self.userID, responseHandel: {(reponse) in
            self.leagueVC.dismissView(league: reponse.league)
        }, errorHandel: {(errorResponse) in
            self.leagueVC.printError(error: errorResponse.error)
        })
    }
}

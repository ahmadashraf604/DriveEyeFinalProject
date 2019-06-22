//
//  SeasonDetailsController.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
class SeasonDetailsPresenter{
    let model:SeasonDetailsModel
    private var seasonDetailsViewProtocol: SeasonDetailsViewProtocol
    
    init(seasonDetailsViewProtocol: SeasonDetailsViewProtocol) {
        self.model = SeasonDetailsModel()
        self.seasonDetailsViewProtocol = seasonDetailsViewProtocol
    }
    
    func getSeasonUsers(seasonId:Int){
        model.getSeasonUsers(seasonId: seasonId, responseHandel: {(seasonUsers) in
            self.seasonDetailsViewProtocol.seasonUsers = seasonUsers
        }, errorHandel: {(errorResponse) in
            self.seasonDetailsViewProtocol.seasonUsers = []
        })
        //TODO Loading view
    }
}

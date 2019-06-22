//
//  SeasonsController.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
class SeasonsPresenter{
    
    let seasonModel:SeasonModel
    private var seasonViewProtocol: SeasonViewProtocol
    
    init(seasonViewProtocol: SeasonViewProtocol) {
        self.seasonModel = SeasonModel()
        self.seasonViewProtocol = seasonViewProtocol
    }
    
    func getSeasonList(){
        return seasonModel.getSeasonList(responseHandel: {(seasons) in
            self.seasonViewProtocol.seasons = seasons
        }, errorHandel: {(errorResponse) in
            self.seasonViewProtocol.seasons = []
        })
    }
}

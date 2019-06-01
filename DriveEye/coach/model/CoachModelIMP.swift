//
//  CoachModelImp.swift
//  DriveEye
//
//  Created by ashraf on 5/27/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire
class CoachModelIMP {
    let  url = URL(string: "https://driveeye.herokuapp.com/coach/getAll")!
    let coaches : [Coach] = []
    func getUsers(complent:@escaping (Error? ,[Coach]) -> ()){
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let coachRequest = try decoder.decode(CoachRespose.self, from: data)
                if coachRequest.status{
                    print(coachRequest.response)
                    complent(nil,coachRequest.response)
                }
            } catch let error {
                print(error)
                complent(error,self.coaches)
            }
        }
        
    }
    
}

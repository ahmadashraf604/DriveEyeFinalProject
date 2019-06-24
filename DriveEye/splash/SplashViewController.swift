//
//  SplashViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/24/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {timer in
            if Utils.getCurrentUserId() == 0 { //login
                let storyBoard : UIStoryboard = UIStoryboard(name: "LoginAndRegistraion", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "loginScreen") as! UINavigationController
                nextViewController.modalTransitionStyle = .flipHorizontal
                self.present(nextViewController, animated:true, completion:nil)
            }
            else {
                let storyBoard : UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeStore") as! UITabBarController
                nextViewController.modalTransitionStyle = .flipHorizontal
                self.present(nextViewController, animated:true, completion:nil)
            }
        })
        
    }

}

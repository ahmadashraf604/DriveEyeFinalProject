//
//  CustomMenueViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/17/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class CustomMenueViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    private var action: ActionEnum = .add
    var leagueVC: LeagueDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let fittedSize = stackView?.sizeThatFits(UILayoutFittingCompressedSize){
            preferredContentSize = CGSize(width: fittedSize.width + 20, height: fittedSize.height + 20)
        }
    }
    
    @IBAction func addNewLeague(_ sender: UIButton) {
        action = .add		
        performSegue(withIdentifier: "openAlertLeague", sender: self)
    }
    
    
    @IBAction func joinExistingLeague(_ sender: UIButton) {
        action = .join
        performSegue(withIdentifier: "openAlertLeague", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAlertLeague" {
            let leageAlertVC = segue.destination as! LeagueAlertViewController
            leageAlertVC.leagueVC = self.leagueVC
            leageAlertVC.action = action
        }
    }
    
    
}

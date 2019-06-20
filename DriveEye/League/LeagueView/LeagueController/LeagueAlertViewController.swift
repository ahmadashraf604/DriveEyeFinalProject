//
//  LeagueAlertViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LeagueAlertViewController: UIViewController, LeagueAlertDelegate {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var leagueDetailLabel: UILabel!
    @IBOutlet weak var leagueNameTF: UITextField!
    
    var action: ActionEnum = .add
    var presenter: LeagueAlertPresenter!
    var leagueVC: LeagueDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LeagueAlertPresenter(leagueVC: self)
        stackView.addBackground(color: .white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch action {
        case .add:
            self.setLabelText(labelText: "Add", type: "Name")
        case .join:
            self.setLabelText(labelText: "Join", type: "Code")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let fittedSize = stackView?.sizeThatFits(UILayoutFittingCompressedSize){
            preferredContentSize = CGSize(width: fittedSize.width + 20, height: fittedSize.height + 20)
        }
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismissView()
    }
    
    @IBAction func actionHandel(_ sender: UIButton) {
        let leagueName = leagueNameTF.text!
        switch action {
        case .add:
            self.presenter.addLeague(leagueName: leagueName)
        case .join:
            self.presenter.joinLeague(leagueCode: leagueName)
        }
        
    }
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissView(league: League) {
        leagueVC.addLeague(league: league)
        dismissView()
    }
    
    func printError(error: String) {
        errorLabel.text = error
        errorLabel.isHidden = false
    }
    
    private func setLabelText(labelText: String ,type: String){
        self.actionBtn.setTitle(labelText, for: .normal)
        self.leagueDetailLabel.text = "Enter the league \(type)"
    }
}


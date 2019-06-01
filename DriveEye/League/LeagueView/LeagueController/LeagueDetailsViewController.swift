//
//  LeagueDetailsViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LeagueDetailsDelegate {
    
    var league: League!
    var presenter: LeagueDetailsPresenter!
    var users = [UserLeague]()
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var leagueOwnerLabel: UILabel!
    @IBOutlet weak var leagueCodeLabel: UILabel!
    @IBOutlet weak var leagueTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LeagueDetailsPresenter(leagueVC: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leagueNameLabel.text = league.name
        leagueCodeLabel.text = league.code
        leagueOwnerLabel.text = String(league.ownerID)
        presenter.getUsers(leagueID: league.leagueID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueDetailsCell", for: indexPath) as! LeagueTableViewCell
        let user = users[indexPath.row]
        cell.scoreLabel.text = String(user.score)
        cell.leagueNameLabel.text = user.username
        cell.rankLabel.text =  String(user.rank)
        return cell
    }
    
    func setLeagueUsers(users: [UserLeague]) {
        self.users = users
        self.leagueTableView.reloadData()
    }
}


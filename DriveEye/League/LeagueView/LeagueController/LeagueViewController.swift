//
//  LeagueViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LeagueDelegate {
    
    @IBOutlet var btnMenue: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    
    var leagueDetailsVC: LeagueDetailsViewController!
    var presenter: LeaguePresenter!
    var leagues = [League]()
    private var action: ActionEnum = .add
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagueDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetailsVC") as! LeagueDetailsViewController
        presenter = LeaguePresenter(leagueVC: self)
        presenter.getLeague()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        let league = leagues[indexPath.row]
        cell.scoreLabel.text = String(league.score)
        cell.leagueNameLabel.text = league.name
        cell.rankLabel.text =  String(league.rank)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueDetailsVC.league = leagues[indexPath.row]
        self.navigationController?.show(leagueDetailsVC, sender: self)
    }
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        btnMenue.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
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
    
    func setLeagues(leagues: [League]) {
        self.leagues = leagues
        self.tableView.reloadData()
    }
    
    func addLeague(league: League) {
        self.leagues.append(league)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAlertLeague" {
            let leageAlertVC = segue.destination as! LeagueAlertViewController
            leageAlertVC.leagueVC = self
            leageAlertVC.action = action
        }
    }
    
}

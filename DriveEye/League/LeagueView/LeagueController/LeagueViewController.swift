//
//  LeagueViewController.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPopoverPresentationControllerDelegate, LeagueDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let emptyView = EmptyViewController(nibName: "", bundle: nil)
    var leagueDetailsVC: LeagueDetailsViewController!
    var presenter: LeaguePresenter!
    var leagues = [League]()
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
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
    
    func setLeagues(leagues: [League]) {
        emptyView.removeFromParentViewController()
        self.leagues = leagues
        self.tableView.reloadData()
    }
    
    func addLeague(league: League) {
        emptyView.removeFromParentViewController()
        self.leagues.append(league)
        self.tableView.reloadData()
    }
    
    func displayNoData() {
        self.view.addSubview(emptyView.view)
        emptyView.didMove(toParentViewController: self)
        emptyView.view.frame = CGRect(x:0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func displayNetworkError(error: String) {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "openPopOverMenue" {
            let customMenueVC = segue.destination as! CustomMenueViewController
            customMenueVC.leagueVC = self
            if let ppc = segue.destination.popoverPresentationController{
                ppc.delegate = self
            }
        }
    }
    
}


//
//  SeasonTableViewController.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class SeasonTableViewController: UITableViewController , SeasonViewProtocol {
    var seasons: [Season] {
        get{
            return []
        }
        set{
            seasonList = newValue
            tableView.reloadData()
        }
    }
    
    var seasonsPresenter:SeasonsPresenter!
    
    var seasonList:[Season]? = nil
    
    
    var seasonDeatailsViewController: SeasonDetailsViewController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.preferredDisplayMode = .primaryOverlay
        seasonsPresenter = SeasonsPresenter(seasonViewProtocol: self)
        seasonsPresenter.getSeasonList()
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            seasonDeatailsViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? SeasonDetailsViewController
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.splitViewController?.preferredDisplayMode = .automatic
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return seasonList?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath) as! SeasonTableViewCell
        cell.startDateLabel.text = seasonList?[indexPath.row].startDate ?? "?-?-?"
        cell.endDateLabel.text = seasonList?[indexPath.row].endDate ?? "?-?-?"
        cell.highScoreLAbel.text = String(describing: seasonList?[indexPath.row].highScore ?? 0)
        cell.myScoreLabel.text = String(describing: seasonList?[indexPath.row].myScore ?? 0)
        cell.myRankLabel.text = String(describing: seasonList?[indexPath.row].myRank ?? 0)
        return cell
    }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! SeasonDetailsViewController
                controller.detailItem = seasonList?[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    
    
}

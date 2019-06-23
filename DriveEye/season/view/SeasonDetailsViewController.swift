//
//  SeasonDeatailsViewController.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class SeasonDetailsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , SeasonDetailsViewProtocol{
    
    

    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    
        var seasonUsers: [SeasonUser] {
            get{
                return []
            }
            set{
                seasonUserList = newValue
                userTableView.reloadData()
            }
        }
    var detailItem: Season? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    var seasonUserList:[SeasonUser]?{
        didSet{
            if seasonUserList?.count == 0{
                NoDataMessageView.displayNoData(parent: self.view)
            }
        }
    }
    
      var seasonDetailsPresenter:SeasonDetailsPresenter!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            startDateLabel?.text = "Start Date: " + detail.endDate
            endDateLabel?.text = "End Date: " + detail.startDate
            seasonDetailsPresenter?.getSeasonUsers(seasonId: detail.seasonID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seasonDetailsPresenter = SeasonDetailsPresenter(seasonDetailsViewProtocol: self)
        configureView()
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonUserList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userSeasonCell", for: indexPath) as! UserSeasonTableViewCell
        cell.userRank.text = String(describing: seasonUserList?[indexPath.row].rank ?? 0)
        cell.userName.text = seasonUserList?[indexPath.row].username ?? ""
        cell.userScore.text = String(describing: seasonUserList?[indexPath.row].score ?? 0)
        return cell
    }
    
    
    

}


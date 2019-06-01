//
//  CoachTVController.swift
//  DriveEye
//
//  Created by ashraf on 5/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class CoachTableViewController: UITableViewController  ,CoachViewProtocol{
  
    var presenter   =  CoachPresenter(coachModel: CoachModelIMP())
    var coaches : [Coach] = []
    let alertServices = AlertServices ()
  
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        coaches = [Coach] ()
        presenter.getAllCoach()
    }
    func displayData(coaches: [Coach]) {
        self.coaches = coaches
        tableView.reloadData()
    }
    func displayEmptyTable() {
        let alert = UIAlertController(title: "coach", message: "no coaches found", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        }
        alert.addAction(OKAction)
        
        present(alert, animated: true,completion:nil)
  
    }
    func doSomething(action: UIAlertAction) {
        //Use action.title
    }
        override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coaches.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoachIdentifier", for: indexPath) as! CoachTVCell
        cell.title.text = coaches[indexPath.row].title
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = alertServices.alert(title: coaches[indexPath.row].title, describtion: coaches[indexPath.row].responseDescription)
        present(alert, animated: true)
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

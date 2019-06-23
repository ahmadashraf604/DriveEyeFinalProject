//
//  ProfileController.swift
//  DriveEye
//
//  Created by MacBookPro on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileController: UIViewController , UserProfileDelegate {
    let presenter  =  ProfilePresenter(userModel: UserProfileModel())
    var user : UserInfo!
    var badge : Badge!
    var badgeList:Array<Badge> = []
    
    func displayErrorMessage() {
        
    }
    
    
    //main Info
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    //personal Info
    @IBOutlet weak var userFirstName: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userBithDate: UILabel!
    
    //car Info
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carBrand: UILabel!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carReleaseYear: UILabel!
    
    
    //badges
    @IBOutlet weak var collectionViewBadges: UICollectionView!
    
    
    let imgUrl = "https://driveeye.herokuapp.com"
    let bagdeUrl = "https://driveeye.herokuapp.com"
    
    override func viewDidLoad() {
        if userImage != nil{
        userImage.roundedImg()
        }
        if profileImg != nil {
        profileImg.roundedImg()
        }
        if collectionViewBadges != nil {
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.attachView(delegate: self)
        presenter.getUserData(id: Utils.getCurrentUserId())
        
    }
    
    var userbadges = [UserSeasonBadgeCollection]()
    
    func displayUserData(user: UserInfo) {
        userbadges = user.userSeasonBadgeCollection ?? [UserSeasonBadgeCollection] ()
        self.collectionViewBadges?.reloadData()
        let imageUrl = imgUrl + user.image
        userImage?.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "logo.png"))
        profileImg?.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "logo.png"))
        
        if firstView != nil {
            userNameLabel.text = user.firstName
            userLevelLabel.text = "level: \(String(user.level))"
        }else if userEmail != nil{
            userFirstName.text = user.firstName
            userLastName.text = user.lastName
            userEmail.text = user.email
            userCity.text = user.city.name
            userBithDate.text = user.birthdate
           
            // profilePicture.image = user.image
        }else  if carModel != nil{
            carBrand.text = user.car!.brand
            carModel.text = user.car!.model
            carReleaseYear.text = "2010"
        }
        else{
            print("ui is lable ")
        }
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
        } else {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
    
}

extension ProfileController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userbadges.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewBadges.dequeueReusableCell(withReuseIdentifier: "badgeCell", for: indexPath)as? CollectionViewCellBadge
        cell?.bage.sd_setImage(with: URL(string: bagdeUrl + userbadges[indexPath.row].badge.image), placeholderImage: UIImage(named: "logo.png"))
       cell?.layer.masksToBounds = true
        //cell?.layer.cornerRadius = 4
        return cell!
    } 
}

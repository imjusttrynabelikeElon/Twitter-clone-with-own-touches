//
//  TwitterProfileSideViewController.swift
//  twitter
//
//  Created by Karon Bell on 5/15/23.
//

import Foundation
import UIKit

struct sideProfileData {
    var name: String
    var userName: String
    var followingNumber: String
    var followingName: String
    var followerNumber: String
    var followerName: String
}

class TwitterProfileSideViewController: UIViewController {
    
    let twitterHomeFeed = twitterHomeFeedTableView()
    var name = UILabel()
    var userName = UILabel()
    let following = UILabel()
    let followingName = UILabel()
    let followers = UILabel()
    let followersName = UILabel()
    let profileImagePic = UIImageView()
    
    let userData = sideProfileData(name: "Karon Bell", userName: "@karonbell", followingNumber: "21",followingName: "Following", followerNumber: "233,000", followerName: "Followers")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = userData.name
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            name.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -690)
        ])
        
        userName.text = userData.userName
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        
        NSLayoutConstraint.activate([
            userName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            userName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -660)
        
        ])
        
        following.text = userData.followingNumber
        following.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(following)
        
        
        NSLayoutConstraint.activate([
            following.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135),
            following.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        
        ])
        
        followingName.text = userData.followingName
        followingName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followingName)
        
        NSLayoutConstraint.activate([
        
            followingName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 213),
            followingName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        
        
        followers.text = userData.followerNumber
        followers.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followers)
        
        NSLayoutConstraint.activate([
        
            followers.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 288),
            followers.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        
        followersName.text = userData.followerName
        followersName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followersName)
        
        NSLayoutConstraint.activate([
        
            followersName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 366),
            followersName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        profileImagePic.image = UIImage(named: "kb")
        profileImagePic.translatesAutoresizingMaskIntoConstraints = false
        profileImagePic.layer.masksToBounds = false
        profileImagePic.layer.cornerRadius = 23.0
        profileImagePic.clipsToBounds = true
        view.addSubview(profileImagePic)
        
        NSLayoutConstraint.activate([
            profileImagePic.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 163),
            profileImagePic.topAnchor.constraint(equalTo: view.topAnchor, constant: 61),
            profileImagePic.widthAnchor.constraint(equalToConstant: 46),
            profileImagePic.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        // Customize the view and add necessary UI elements
    
        // Customize the view and add necessary UI elements
        
        // Example: Create a background color
        view.backgroundColor = UIColor.white
        
        // Example: Add a label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleLabel.text = "Profile Side View"
        titleLabel.textAlignment = .center
        titleLabel.center = view.center
        view.addSubview(titleLabel)
        
        
        
   
    }
    
    // Rest of the class implementation
}

class TwitterProfilePresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}


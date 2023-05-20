//
//  TwitterProfileView.swift
//  twitter
//
//  Created by Karon Bell on 5/17/23.
//

import Foundation
import UIKit


class TwitterProfileView: UIViewController {
    let container = UIView() // Use a UIView as the container
    let tabBar2 = twitterTabBarProfileTapped()
    let tabBar1 = TwitterDummyView()
    var homeVC: TwitterHomePage? // Declare homeVC as an optional TwitterHomePage instance
    var nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view hierarchy
        if let homeVC = homeVC {
            addChild(homeVC)
            homeVC.view.frame = container.bounds
            container.addSubview(homeVC.view) // Add homeVC.view to the container
            homeVC.didMove(toParent: self)
            
            tabBar2.homeVC = homeVC // Connect tabBar2 with homeVC
        }
        
        view.addSubview(container)
        view.addSubview(tabBar2.view)
        view.addSubview(tabBar1.view)
        
        // Configure the layout
        container.translatesAutoresizingMaskIntoConstraints = false
        tabBar2.view.translatesAutoresizingMaskIntoConstraints = false
        tabBar1.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                container.topAnchor.constraint(equalTo: view.topAnchor), // Update the top constraint to view.topAnchor
                container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 333),
                container.bottomAnchor.constraint(equalTo: tabBar2.view.topAnchor, constant: 2),
                
                tabBar2.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tabBar2.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tabBar2.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 33),
                
                tabBar1.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tabBar1.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tabBar1.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        // Hide elements from TwitterHomePage
        tabBar2.homeVC.tableViewContainer.isHidden = true
        tabBar2.homeVC.followingTabBarItem.title = ""
        tabBar2.homeVC.forYouTabBarItem.title = ""
        tabBar2.homeVC.twitterLogoImageView.isHidden = true
        tabBar2.homeVC.twitterHomeFeedViewController.view.isHidden = true
        tabBar2.homeVC.addTweetButton.isHidden = true
      
        view.backgroundColor = .white
        
        // Create a custom back bar button item
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .blue
        
        nameLabel.text = "KUGIKGIU"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 133),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            // Add other constraints for the nameLabel if needed
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
//

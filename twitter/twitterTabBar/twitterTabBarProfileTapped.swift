//
//  twitterTabBarProfileTapped.swift
//  twitter
//
//  Created by Karon Bell on 5/18/23.
//

import Foundation
import UIKit



class twitterTabBarProfileTappedContainer: UIViewController {
    
    private let tabBar = twitterTabBarProfileTapped()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addChild(tabBar)
        view.addSubview(tabBar.view)
        tabBar.view.frame = view.bounds
        tabBar.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.view.frame = view.bounds
    }
}



class twitterTabBarProfileTapped: UITabBarController {
    
    var homeVC = TwitterHomePage()
    var tabBarTwitterVC = TwitterTabBarr()
    let feedViewVC = twitterHomeFeedTableView()
       override func viewDidLoad() {
           super.viewDidLoad()
           
           let searchVC = TwitterSearchView()
           let notificationsVC = TwitterNotificationView()
           let messagesVC = DirectMessagesView()
           let spacesVC = TwitterSpacesView()
           let createAccountPage = createAccountPage()
           
           homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
           searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
           notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 2)
           messagesVC.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(systemName: "envelope"), tag: 3)
           spacesVC.tabBarItem = UITabBarItem(title: "Spaces", image: UIImage(systemName: "speaker.wave.3"), tag: 4)
           createAccountPage.tabBarItem = UITabBarItem(title: "Create Account", image: UIImage(systemName: "person.badge.plus"), tag: 5)
           
           let tabBarList = [homeVC, searchVC, notificationsVC, messagesVC, spacesVC, createAccountPage]
           viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
       }
}
//



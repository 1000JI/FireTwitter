//
//  MainTabController.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/06/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            trailing: view.trailingAnchor,
                            paddingBottom: 64,
                            paddingTrailing: 16,
                            width: 56,
                            height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        let feed = FeedController()
        let nav1 = templateNavigationController(
            image: UIImage(named: "home_unselected"),
            rootViewController: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(
            image: UIImage(named: "search_unselected"),
            rootViewController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(
            image: UIImage(named: "like_unselected"),
            rootViewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(
            image: UIImage(named: "ic_mail_outline_white_2x-1"),
            rootViewController: conversations)
        
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    
}

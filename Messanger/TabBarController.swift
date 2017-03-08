//  TabBarController.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-07.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsController = FriendsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let recentMessagesNavController = UINavigationController(rootViewController: friendsController)
        recentMessagesNavController.tabBarItem.title = "Recent"
        recentMessagesNavController.tabBarItem.image = UIImage(named: "recent")?.resizeToWidth(26)

        let callController = createViewControllers(with: "Call", imageName: "call")
        let momentController = createViewControllers(with: "Moment", imageName: "moment")
        let settingController = createViewControllers(with: "Setting", imageName: "setting")
        
        viewControllers = [recentMessagesNavController, callController, momentController, settingController]
    }
    
    private func createViewControllers(with title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)?.resizeToWidth(26).withRenderingMode(.alwaysOriginal)
        return navController
    }
    
}

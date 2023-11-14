//
//  TabBarController.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 28.08.2022.
//

import UIKit
import EasyPeasy

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.reloadInputViews()
        
        tabBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        tabBar.unselectedItemTintColor = UIColor(named: "colorDarkGray")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func setupTabBar () {
        
        reloadInputViews()
        
        let chatViewController = creatNavController(vc: ChatListVC(), itemName: "", itemImage: "chat-new1", selectedItemImage: "chat-new2")
        let feedViewController = creatNavController(vc: FeedVC(), itemName: "", itemImage: "search-new1", selectedItemImage: "search-new2")
        let addViewController = creatNavController(vc: AddVC(), itemName: "", itemImage: "add-new1", selectedItemImage: "add-new2")
        let profileViewController = creatNavController(vc: ProfileAndSettingsVC(), itemName: "", itemImage: "user-new1", selectedItemImage: "user-new2")
        
        viewControllers = [chatViewController, feedViewController, addViewController, profileViewController]
    }
    
    func creatNavController(vc: UIViewController,
                            itemName: String,
                            itemImage: String,
                            selectedItemImage: String) -> UINavigationController {
            let item = UITabBarItem(title: itemName,
                                    image: UIImage(named: itemImage)?.withRenderingMode(.alwaysTemplate),
                                    selectedImage: UIImage(named: selectedItemImage)?.withRenderingMode(.alwaysTemplate))
            let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = item
            navController.reloadInputViews()
            return navController
    }
}

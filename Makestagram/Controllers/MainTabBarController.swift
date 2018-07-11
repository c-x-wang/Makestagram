//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Cindy Wang on 7/11/18.
//  Copyright © 2018 cxw. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            print("take photo")
            
            return false
        } else {
            return true
        }
    }
}

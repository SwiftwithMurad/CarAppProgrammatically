//
//  TabBarController.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        let firstVC = UINavigationController(rootViewController: HomeController())
        firstVC.tabBarItem = UITabBarItem(title: "Vehicles", image: UIImage(systemName: "steeringwheel"), tag: 1)
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = UINavigationController(rootViewController: VehiclesController())
        secondVC.tabBarItem.image = UIImage(named: "", in: Bundle(for: TabBarController.self), compatibleWith: nil)
        secondVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC, secondVC]
    }
}

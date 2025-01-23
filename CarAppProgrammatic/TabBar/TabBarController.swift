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
        firstVC.tabBarItem.image = UIImage(named: "", in: Bundle(for: TabBarController.self), compatibleWith: nil)
        firstVC.tabBarItem.image = UIImage(systemName: "steeringwheel")
        firstVC.title = "Vehicles"
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = UINavigationController(rootViewController: VehiclesController())
        secondVC.tabBarItem.image = UIImage(named: "", in: Bundle(for: TabBarController.self), compatibleWith: nil)
        secondVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        secondVC.title = "Search"
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC, secondVC]
    }
}

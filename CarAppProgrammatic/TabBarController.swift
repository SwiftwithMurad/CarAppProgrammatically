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
    
    func setupViewControllers() {
        let firstVC = VehiclesController()
        firstVC.tabBarItem.image = UIImage(named: "", in: Bundle(for: TabBarController.self), compatibleWith: nil)
        firstVC.tabBarItem.title = "Vehicles"
        firstVC.tabBarItem.image = UIImage(systemName: "steeringwheel")
        firstVC.title = "Car Rental"
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = AllCarsController()
        secondVC.tabBarItem.image = UIImage(named: "", in: Bundle(for: TabBarController.self), compatibleWith: nil)
        secondVC.tabBarItem.title = "Search"
        secondVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        secondVC.title = "Search"
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC, secondVC]
    }
}

//extension TabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let controller = UITabBarController()
//        
//    }
//}

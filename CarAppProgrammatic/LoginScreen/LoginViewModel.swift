//
//  LoginViewModel.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import Foundation
import UIKit

class LoginViewModel {
    let manager = UserDefaultsManager()
    
    func configLogin(email: String, password: String) {
        let controller = HomeController()
        let navigation = UINavigationController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            if !(email.isEmpty && password.isEmpty) {
                sceneDelegate.homeRoot()
                manager.setValue(value: true, key: .isLoggedIn)
                navigation.navigationController?.show(controller, sender: nil)
            }
        }
    }
}

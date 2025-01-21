//
//  UserDefaultsManager.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import Foundation

class UserDefaultsManager {
    enum UserDefaultsTypes: String {
        case isLoggedIn = "isLoggedIn"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }

}

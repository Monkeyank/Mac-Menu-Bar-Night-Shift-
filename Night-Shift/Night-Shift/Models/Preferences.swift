//
//  Preferences.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Foundation

enum Keys {
    static let isAutoLaunchEnabled = "isAutoLaunchEnabled"
}

class Preferences {
    
    static let sharedPrefs = Preferences()
    
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    private init() {
        registerFactoryDefaults()
    }
    
    private func registerFactoryDefaults() {
        let factoryDefaults = [Keys.isAutoLaunchEnabled: NSNumber(value: false)] as [String : Any]
        
        userDefaults.register(defaults: factoryDefaults)
    }
    
    func synchronize() {
        userDefaults.synchronize()
    }
    
    func reset() {
        userDefaults.removeObject(forKey: Keys.isAutoLaunchEnabled)
        synchronize()
    }
    
}

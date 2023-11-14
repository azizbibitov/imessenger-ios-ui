//
//  UserDefaults.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 05.08.2022.
//

import Foundation

class AccountUserDefaults {
    
    static let shared = AccountUserDefaults()

    func savePinCodeApp(pinCode: String) {
        UserDefaults.standard.set(pinCode, forKey: "pin_code_app")
    }
    
    func getPinCodeApp() -> String {
        return UserDefaults.standard.string(forKey: "pin_code_app") ?? ""
    }
    
    func clearUserDefaults(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    func firstOpen() {
        UserDefaults.standard.set(true, forKey: "first_open")
    }
    
    func isFirstOpen() -> Bool {
        return !(UserDefaults.standard.bool(forKey: "first_open"))
    }
}

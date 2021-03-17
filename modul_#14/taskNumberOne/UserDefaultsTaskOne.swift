//
//  UserDefaultsTaskOne.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//

import Foundation

class UserDefaultsTaskOne {
    static let shared = UserDefaultsTaskOne()
    private let kUserNameKey = "UserDefaultsTaskOne.kUserNameKey"
    private let kUserSoNameKey = "UserDefaultsTaskOne.kUserSoNameKey"
    
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    var userSoName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserSoNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserSoNameKey)}
    }
}

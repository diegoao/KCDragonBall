//
//  LocalDataModel.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 15/1/24.
//

import Foundation

struct LocalDataModel {
    private enum Constants {
        static let tokenKey = "KCToken"
    }
    
    private static let userDefaults = UserDefaults.standard
    
    static func getToken() -> String? {
        return userDefaults.string(forKey: Constants.tokenKey)
    }
    
    static func save(token: String) {
        userDefaults.set(token, forKey: Constants.tokenKey)
    }
    
    static func deleteToken() {
        userDefaults.removeObject(forKey: Constants.tokenKey)
    }
}


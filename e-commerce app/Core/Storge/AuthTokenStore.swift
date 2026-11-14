//
//  AuthTokenStore.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

protocol AuthTokenStore {
    
    func save(_ token: String)
    func getToken() -> String?
    func isAuthenticated() -> Bool
    func clearToekn()
    
    
}



//UserDefaults == SharedPref
final class UserDefaultsAuthTokenStore: AuthTokenStore {
    
    static let authTokenKey = "authToken"
    
    private let defaults: UserDefaults
    private var cachedToken: String?
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func save(_ token: String) {
        cachedToken = token
        defaults.set(token, forKey: Self.authTokenKey)
    }
    
    func getToken() -> String? {
        if let cachedToken {return cachedToken}
        cachedToken = defaults.string(forKey: Self.authTokenKey)
        return cachedToken
    }
    
    func isAuthenticated() -> Bool {
        guard let token = getToken() else  {return false}
        return !token.isEmpty
        
    }
    
    func clearToekn() {
        cachedToken = nil
        defaults.removeObject(forKey: Self.authTokenKey)
    }
}

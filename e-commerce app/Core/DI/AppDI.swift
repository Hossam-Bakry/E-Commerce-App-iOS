//
//  AppDI.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation

// App Dependency Injection
enum AppDI {
    
    static func setup(_ locator: ServiceLocator = .shared) {
        
        /// create for all objects [service] we need to run our app
        /// AppRouter, APIClient,
        ///
        ///
        
        // 1- Auth Store
        locator.registerLazySingleton(AuthTokenStore.self) {
            UserDefaultsAuthTokenStore()
        }
        
        // 2- Shared API Client
        locator.registerLazySingleton(APIClient.self) {
            APIClient(tokenStore: locator.resolve(AuthTokenStore.self))
        }
        
        
        // 3- App-Wide Services
        locator.registerLazySingleton(AppRouter.self) {AppRouter()}
        locator.registerLazySingleton(FeedbackCenter.self){FeedbackCenter()}
        
        
        // 401 -> go back to sign-in
        let router = locator.resolve(AppRouter.self)
        locator.resolve(APIClient.self).onUnauthorized = { [weak router] in
            router?.resetToSignIn()
            
        }
        
        
        // 4- Features
        AuthDI.setup(locator)
        
        
        
    }
    
}

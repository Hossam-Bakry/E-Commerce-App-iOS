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
        
        
        // App-Wide Services
        locator.registerLazySingleton(AppRouter.self) {AppRouter()}
        
        
    }
    
}

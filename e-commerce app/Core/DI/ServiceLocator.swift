//
//  ServiceLocator.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation


final class ServiceLocator {
    
    static let shared = ServiceLocator()
    
    
    /// 3 storges
    private var factories: [ObjectIdentifier: () -> Any] = [:]
    private var singletons: [ObjectIdentifier:  Any] = [:]
    private var lazyKeys: Set<ObjectIdentifier> = []
    
    
    func registerLazySingleton<T>(_ type: T.Type, _ factory: @escaping () -> T) {
        
        let key = ObjectIdentifier(type)
        factories[key] = factory // 1- save the recipe
        lazyKeys.insert(key)     // 2- mark it as a singlton
        singletons[key] = nil    // 3- clear any old instance
    }
    
    func registerFactory<T>(_ type: T.Type, _ factory: @escaping () -> T) {
        
        let key = ObjectIdentifier(type)
        factories[key] = factory
        lazyKeys.remove(key)
    }
    
    
    func resolve<T>(_ type: T.Type = T.self) -> T {
        
        let key = ObjectIdentifier(type)
        
        if let existing = singletons[key] as? T {
            return existing
        }
        
        guard let factory = factories[key] else {
            fatalError("No registration found for \(type)")
        }
        
        let instance = factory() as! T
        
        if lazyKeys.contains(key) {
            singletons[key] = instance
        }
        return instance
    
        
        
    }
}



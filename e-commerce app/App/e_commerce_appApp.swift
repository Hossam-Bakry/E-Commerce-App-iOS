//
//  e_commerce_appApp.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

// properity wrappers [setState, change notifer ]
// 1- @State
// 2- @Binding

// 3- @Observable [Changer Notifier ]
// 4- @Enviroment

import SwiftUI


@main
struct e_commerce_appApp: App {
    
    /// initialize for utils and class [objects]
    
    
    private let router: AppRouter
    
    init() {
        AppDI.setup()
        /// TODO: create AppRouter object
        /// ServiceLocator [getIt]
        router = ServiceLocator.shared.resolve(AppRouter.self)
    }
    
    
    
    var body: some Scene {
        // Material App
        WindowGroup {
            RootView()
                .environment(router)
        }
    }
}


enum AppScreen {
    
    case splash
    case signIn
    case mainLayout
    
}

/// navigation.push

struct RootView: View {
    
    @Environment(AppRouter.self) private var router
    

    
    var body: some View {
        
        @Bindable var router = router
        
        Group {
          
            switch router.root {
                
            case .splash:
                SplashView()
                
            case .signIn:
                NavigationStack(path: $router.path ) {
                    // push --> append [paths (signUp)]
                    SignInScreen()
                        .navigationDestination(for: Route.self) {
                            RouteDestination(route: $0)
                        }
                }
                
            case .mainLayout:
                NavigationStack(path: $router.path) {
                    MainLayoutView()
                        .navigationDestination(for: Route.self) {
                            RouteDestination(route: $0)
                        }
                }
                
            }
            
            
        }
        
        
    }
}

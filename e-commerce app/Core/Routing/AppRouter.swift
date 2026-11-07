//
//  AppRouter.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import SwiftUI

// 1- SignUp
// 2- cart
// 3- products
// 4- productDetails


// * Zones || RouteScreen

// 1- splash
// 2- signIn
// 3- main

enum Route: Hashable {
    // identyfier for each screen
    case signUp
    case cart
    case products
    case ProductDetails
    
}


/// world [PushNamedAnd RemoveUntil]
enum RouteScreen {
    case splash
    case signIn
    case mainLayout
}


@Observable
final class AppRouter {
    
    var root: RouteScreen = .splash
    var path: [Route] = []
    
    /// functions
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        
       _ = path.popLast()
    }
    
    /// 'pushNamedAndRemoveUntil(Routes.mainLayout, (route) => false)
    func resetToMain() {
        path = []
        root = .mainLayout
        
    }
    
    func resetToSignIn() {
        path = []
        root = .signIn
    }
}


struct RouteDestination: View {
    
    let route: Route
    
    var body: some View {
        
        switch route {
        case .signUp:
            SignUpScreen()
        case .cart:
//            CartScreen()
            
        case .products:
//            ProductsScreen()
            
        case .ProductDetails:
//            ProductDetailsScreen()
        
        }
    }
}

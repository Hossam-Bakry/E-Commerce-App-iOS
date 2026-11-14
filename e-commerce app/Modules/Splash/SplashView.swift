//
//  SplashView.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        
        Image(.splashBackground)
            .overlay{
                Image(.logo)
                    .resizable()
                    .padding(.horizontal, 40)
                    .scaledToFit()
            }.task {
                
                let tokenStore = ServiceLocator.shared.resolve(AuthTokenStore.self)
                
                if tokenStore.isAuthenticated() {
                        var token = tokenStore.getToken()
                    print(token)
                    router.resetToMain()
                } else {
                    router.resetToSignIn()
                }
            
            }
       
    }
}

#Preview {
    SplashView()
}

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
                try? await Task.sleep(for: .seconds(2))
                
                /// token --> main layout
                /// no token auth
                
                // check save for token
                
            }
        
//        ZStack {
//            Image(.splashBackground)
//                .frame(width: .infinity, height: .infinity)
//            Image(.logo)
//                .resizable()
//                .padding(.horizontal, 40)
//                .scaledToFit()
//        }
       
    }
}

#Preview {
    SplashView()
}

//
//  SplashView.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        
        Image(.splashBackground)
            .overlay{
                Image(.logo)
                    .resizable()
                    .padding(.horizontal, 40)
                    .scaledToFit()
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

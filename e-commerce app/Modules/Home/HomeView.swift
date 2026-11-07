//
//  HomeView.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 01/11/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView    {
            VStack(spacing: 10) {
                
                Text("Home")
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

#Preview {
    HomeView()
}

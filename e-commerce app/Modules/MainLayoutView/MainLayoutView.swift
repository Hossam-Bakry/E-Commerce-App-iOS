//
//  MainLayoutView.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 01/11/2026.
//

// configration, utils, services 

import SwiftUI

struct MainLayoutView: View {
    
    enum Tab: CaseIterable {
        
        case home, categories, favorites, profile
        
        func icon(isSelected: Bool) -> String {
            
            let name = switch self {
            case .home: "house"
            case .categories: "square.grid.2x2"
            case .favorites: "heart"
            case .profile: "person"
            }
            
            return isSelected ? "\(name).fill" : name
        }
        
        var title: String {
            switch self {
            case .home: "Home"
            case .categories: "Categories"
            case .favorites: "Favorites"
            case .profile: "Profile"
            }
        }
    }
    
    @State private var currentTab: Tab = .home
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            
            ForEach(Tab.allCases, id: \.self) { tab in
                
                content(for: tab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tabItem{
                        Image(systemName: tab.icon(isSelected: tab == currentTab)).environment(\.symbolVariants, .none)
                        Text(tab.title)
                        
                    }
                
                
            }
        }
    }
    
    
    @ViewBuilder
    private func content(for tab: Tab) -> some View {
        switch tab {
        case .home: HomeView()
        case .categories: CategoriesView()
        case .favorites: FavoritesView()
        case .profile: ProfileView()
        }
    }
}

#Preview {
    MainLayoutView()
}

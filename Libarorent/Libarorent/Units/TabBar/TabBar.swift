//
//  TabBar.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = TabBarViewModel()
    @State private var showTabBar = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            HomeView(showTabBar: $showTabBar)
                .tag(TabBarSelectionView.home.rawValue)
                .toolbar(.hidden, for: .tabBar)
            
            StatisticsView()
                .tag(TabBarSelectionView.statistics.rawValue)
            
            SettingsView()
                .tag(TabBarSelectionView.settings.rawValue)
        }
        .edgesIgnoringSafeArea(.bottom)
        .overlay {
            if showTabBar {
                VStack {
                    Spacer()
                    TabBarCustomView(selectedItem: $viewModel.selection)
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    TabBar()
}

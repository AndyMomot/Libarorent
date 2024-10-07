//
//  HomeView.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var showTabBar: Bool
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.liteBlack.swiftUIColor
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 25) {
                        HomeCategoriesView { category in
                            viewModel.categoryToShow = category
                            viewModel.showCategories.toggle()
                            withAnimation {
                                showTabBar = false
                            }
                        }
                        
                        HStack {
                            Text("Ulubione")
                                .foregroundStyle(.white)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        if viewModel.categories.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Tutaj będziesz mógł zobaczyć produkt, który uważasz za ważny lub który oznaczyłeś jako ulubiony.")
                                    .foregroundStyle(.white)
                                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                                
                                LikeButton(isLiked: true, disabled: true) { _ in }
                                    .frame(width: 51, height: 41)
                            }
                            .padding(.horizontal)
                        } else {
                            
                        }
                    }
                }
                .scrollIndicators(.never)
                .ignoresSafeArea(edges: .top)
            }
            .onAppear {
                withAnimation {
                    showTabBar = true
                    viewModel.getCategories()
                }
            }
            .navigationDestination(isPresented: $viewModel.showCategories) {
                if let category = viewModel.categoryToShow {
                    CategoryListView(category: category)
                }
            }
        }
    }
}

#Preview {
    HomeView(showTabBar: .constant(true))
}

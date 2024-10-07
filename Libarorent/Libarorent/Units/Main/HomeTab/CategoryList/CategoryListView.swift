//
//  CategoryListView.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct CategoryListView: View {
    var category: CategoryModel.Category
    
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.liteBlack.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                BackButton(title: category.title) {}
                    
                ScrollView {
                    
                    // Add
                    HStack(spacing: 24) {
                        Text("Stwórz swój pierwszy produkt i zacznij robić zdjęcia do pracy")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                        
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width: 2)
                        
                        BluePlusButton() {}
                            .frame(width: bounds.width * 0.37, height: 44)
                    }
                    
                    // List
                    ForEach(viewModel.categories) { category in
                        Text(category.name)
                            .foregroundStyle(.white)
                    }
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal)
        }
        .onAppear {
            withAnimation {
                viewModel.getCategories(category: self.category)
            }
        }
    }
}

#Preview {
    CategoryListView(category: .phone)
}

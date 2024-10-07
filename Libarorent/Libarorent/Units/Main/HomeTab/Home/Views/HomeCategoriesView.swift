//
//  HomeCategoriesView.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct HomeCategoriesView: View {
    var action: (CategoryModel.Category) -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: 28) {
            HStack(spacing: bounds.width * 0.11) {
                HomeCategoryCell(category: .phone) { category in
                    action(category)
                }
                
                HomeCategoryCell(category: .computer) { category in
                    action(category)
                }
            }
            .frame(height: bounds.width * 0.35)
            
            HStack(spacing: bounds.width * 0.11) {
                HomeCategoryCell(category: .accessories) { category in
                    action(category)
                }
                
                HomeCategoryCell(category: .other) { category in
                    action(category)
                }
            }
            .frame(height: bounds.width * 0.35)
        }
        .padding(.top, bounds.height * 0.08)
        .padding(.horizontal, bounds.width * 0.0945)
        .padding(.bottom, bounds.width * 0.0945)
        .background(Colors.liteBlue.swiftUIColor)
        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
    }
}

#Preview {
    HomeCategoriesView {_ in}
}

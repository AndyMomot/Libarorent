//
//  HomeCategoryCell.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct HomeCategoryCell: View {
    var category: CategoryModel.Category
    var action: (CategoryModel.Category) -> Void
    
    var body: some View {
        Button {
            action(category)
        } label: {
            ZStack(alignment: .bottom) {
                Colors.silver.swiftUIColor
                
                VStack {
                    Image(category.imageName)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Text(category.title)
                            .foregroundStyle(Colors.liteBlack.swiftUIColor)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                }
                .padding()
            }
            .cornerRadius(10, corners: .allCorners)
        }
    }
}

#Preview {
    HomeCategoryCell(category: .phone) {_ in}
        .frame(width: 148, height: 148)
}

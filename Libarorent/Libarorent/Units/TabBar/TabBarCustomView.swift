//
//  TabBarCustomView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    @State private var items: [TabBar.Item] = [
        .init(imageName: Asset.homeTab.name),
        .init(imageName: Asset.statisticsTab.name),
        .init(imageName: Asset.settingsTab.name)
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.liteBlack.swiftUIColor
            
            Rectangle()
                .foregroundStyle(Colors.darkBlack.swiftUIColor)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .overlay {
                    HStack {
                        let arrange = (0..<items.count)
                        ForEach(arrange, id: \.self) { index in
                            let item = items[index]
                            let isSelected = index == selectedItem
                            
                            Button {
                                selectedItem = index
                            } label: {
                                Image(item.imageName)
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(isSelected ? Colors.liteBlue.swiftUIColor : .white)
                                    .frame(width: 34)
                            }

                            if index < arrange.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, bounds.width * 0.1)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        
        TabBarCustomView(selectedItem: .constant(0))
            .frame(height: 126)
    }
}

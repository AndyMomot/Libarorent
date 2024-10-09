//
//  SettingsButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import SwiftUI

struct SettingsButton: View {
    var imageName: String
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                LinearGradient(
                    colors: [
                        Colors.liteBlue.swiftUIColor,
                        Colors.darkBlue.swiftUIColor.opacity(0.9)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .cornerRadius(22, corners: .allCorners)
                
                HStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 24)
                    
                    Spacer()
                    
                    Text(title)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 16))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    
                    Spacer()
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 24)
                        .hidden()
                }
                .padding(.horizontal, 60)
            }
        }
    }
}

#Preview {
    SettingsButton(imageName: Asset.support.name, title: "Wsparcie") {}
        .frame(height: 44)
        .padding(.horizontal)
}

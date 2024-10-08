//
//  NextButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct NextButton: View {
    var title: String
    var bgColors: [Color] = [
        Colors.liteBlue.swiftUIColor,
        Colors.darkBlue.swiftUIColor.opacity(0.9)
    ]
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                LinearGradient(
                    colors: bgColors,
                    startPoint: .leading,
                    endPoint: .trailing)
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                    .padding(.horizontal, 8)
                
            }
            .cornerRadius(22, corners: .allCorners)
            .shadow(radius: 5, y: 5)
        }
    }
}

#Preview {
    ZStack {
        Colors.silver.swiftUIColor
        NextButton(title: "Komputeryrerererer") {}
            .frame(width: 160, height: 44)
    }
}

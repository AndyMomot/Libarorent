//
//  LikeButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct LikeButton: View {
    @State var isLiked: Bool
    var disabled = false
    var action: (Bool) -> Void
    
    var body: some View {
        Button {
            action(!isLiked)
            
            withAnimation {
                isLiked.toggle()
            }
        } label: {
            ZStack {
                LinearGradient(
                    colors: [.white, Colors.liteBlack.swiftUIColor],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                
                Asset.heartYellow.swiftUIImage
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(
                        isLiked ? Colors.liteOrange.swiftUIColor : .white
                    )
                    .padding(6)
            }
            .cornerRadius(10, corners: .allCorners)
        }
        .disabled(disabled)
    }
}

#Preview {
    ZStack {
        Colors.deepBlue.swiftUIColor
        LikeButton(isLiked: true) {_ in}
            .frame(width: 51, height: 41)
    }
}

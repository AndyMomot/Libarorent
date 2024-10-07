//
//  BluePlusButton.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct BluePlusButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                LinearGradient(
                    colors: [
                        Colors.liteBlue.swiftUIColor.opacity(0.7),
                        Colors.liteBlue.swiftUIColor],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .cornerRadius(22, corners: .allCorners)
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .padding(8)
            }
        }
        
    }
}

#Preview {
    BluePlusButton() {}
        .frame(width: 160, height: 44)
}
